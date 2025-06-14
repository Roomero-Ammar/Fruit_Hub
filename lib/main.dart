import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:fruit_hub/fruit_hub.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/shared_preferences_singleton.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setupGetIt();
  runApp( FruitHub());
}
