import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:tut_app/features/intent/data/datasources/local/ai/IntentDataSource.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/intent/data/models/UserIntent.dart';

@LazySingleton(as: IntentDataSource)
class IntentDataSourceImpl extends IntentDataSource {
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  IntentDataSourceImpl(this.recorder);
  late LiveSession session;

  final controller = StreamController<Uint8List>.broadcast();

  final jsonSchema = Schema.object(
    properties: {
      "intent": Schema.string(),
      "parameters": Schema.object(properties: {"mode": Schema.string()}),
    },
  );

  @override
  Stream<UserIntent> listen() async* {
    final prompt =
        """
      You are an intent extractor. Find out what the user wants from the streamed audio
      and follow this schema $jsonSchema;
      Examples:
    - 'turn off the lights' -> { "intent": "toggle_theme", "parameters": { "mode": "off" } }
    - 'kill the light' -> { "intent": "toggle_theme", "parameters": { "mode": "off" } }
    - 'make it dark' -> { "intent": "toggle_theme", "parameters": { "mode": "dark" } }
    - 'make it emo' -> { "intent": "toggle_theme", "parameters": { "mode": "dark" } }
    """;

    try {
      final model = FirebaseAI.vertexAI(location: 'us-central1')
          .liveGenerativeModel(
            model: 'gemini-2.0-flash-live-preview-04-09',
            systemInstruction: Content.system(prompt),
            liveGenerationConfig: LiveGenerationConfig(
              responseModalities: [ResponseModalities.text],
            ),
          );
      session = await model.connect();

      final mediaChunkStream = controller.stream.map(
        (data) => InlineDataPart('audio/pcm', data),
      );

      mediaChunkStream.listen((chunk) {
        print("Got chunk: $chunk");
      });
      await recorder.openRecorder();
      await recorder.startRecorder(
        codec: Codec.pcm16WAV,
        sampleRate: 16000,
        numChannels: 1,
        toStream: controller.sink,
      );

      final responseStream = session.receive();
      await for (final response in responseStream) {
        final serverMessage = response.message;
        if (serverMessage.runtimeType.toString() == 'LiveServerSetupComplete') {
          // session ready, send audio now
          print("setup");
          await session.sendMediaStream(mediaChunkStream);
        } else {
          print("content"); //this would never print
          final content = (serverMessage as dynamic)
              //.content, .message and .text isn't working,
              .text; // or whatever property holds the string
          print(content); //this would never print

          final json = jsonDecode(content);

          yield UserIntent.fromJson(json);
        }
      }
    } catch (error) {
      print(error);
      throw Exception("Something went wrong");
    }
  }

  @override
  stopListening() async {
    await recorder.stopRecorder();
    await controller.close();
    await session.close();
  }
}
