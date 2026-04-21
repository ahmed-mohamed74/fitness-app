import 'package:fitness_app/fitness_app.dart';
import 'package:fitness_app/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();  
  runApp(const FitnessApp());
}
