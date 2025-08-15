import 'package:flutter/material.dart';
import 'package:tut_app/app.dart';
import 'package:tut_app/core/firebase/firebase_initializer.dart';
import 'package:tut_app/service_locator.dart';

 main() async {
  await initFirebase();
  configureDependencies();
  runApp(App());
}
