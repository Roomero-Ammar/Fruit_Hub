import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:fruit_hub/fruit_hub.dart';
import 'core/services/shared_preferences_singleton.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  runApp( FruitHub());
}
