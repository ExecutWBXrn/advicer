import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '/feature/home/presentation/screens/home_screen.dart';

final routerProvider = Provider<Map<String, WidgetBuilder>>(
  (ref) => {'/': (context) => HomeScreen()},
);
