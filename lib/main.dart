import 'package:flutter/material.dart';
import 'package:fruit_hub/fruit_hub.dart';
import 'core/services/shared_preferences_singleton.dart';

void main() async{
  await Prefs.init();
  runApp( FruitHub());
}
