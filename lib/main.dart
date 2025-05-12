import 'package:flutter/material.dart';
import 'package:rick_and_morty/app.dart';
import 'package:rick_and_morty/config/router.dart';
import 'package:rick_and_morty/dependency_injection/app_component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  AppRouterHelper.instance;
  runApp(const RickAndMortyApp());
}
