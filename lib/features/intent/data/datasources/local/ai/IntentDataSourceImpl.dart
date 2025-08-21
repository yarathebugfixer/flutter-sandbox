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
  final controller = StreamController<Uint8List>.broadcast();

  final jsonSchema = Schema.object(
    properties: {
      "intent": Schema.string(),
      "parameters": Schema.object(properties: {"mode": Schema.string()}),
    },
  );

  @override
  Future<UserIntent> listen() async {
    await recorder.openRecorder();
    await recorder.startRecorder(
      codec: Codec.pcm16,
      sampleRate: 16000,
      numChannels: 1,
      toStream: controller.sink,
    );
    try {
      final model = FirebaseAI.vertexAI(location: 'global').generativeModel(
        model: 'gemini-2.5-flash',
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: jsonSchema,
        ),
      );
      final prompt = 
          """
          You are an intent extractor. Find out what the user wants. 
          Examples:
        - 'turn off the lights' -> { "intent": "toggle_theme", "parameters": { "mode": "off" } }
        - 'kill the light' -> { "intent": "toggle_theme", "parameters": { "mode": "off" } }
        - 'make it dark' -> { "intent": "toggle_theme", "parameters": { "mode": "dark" } }
        - 'make it emo' -> { "intent": "toggle_theme", "parameters": { "mode": "dark" } }
        - 'light mode please' -> { "intent": "toggle_theme", "parameters": { "mode": "light" }
          user says: "dark mode"
          """;
      final modelResponse = await model.generateContent([Content.text(prompt)]);
      final UserIntent userIntentFromModel;
      final decoded = jsonDecode(modelResponse.text as String);
      if (decoded is Map<String, dynamic>) {
        final userIntent = UserIntent.fromJson(decoded);
        userIntentFromModel = userIntent;
      }else{
         userIntentFromModel = UserIntent(intent: "", parameters: {});
      }

      return userIntentFromModel;
    } catch (error) {
      throw Exception("Something went wrong");
    }
  }

  @override
  stopListening() {
    recorder.stopRecorder();
  }
}
