import 'package:flutter/material.dart';
import 'package:adviser/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        initialRoute: '/',
        routes: {'/': (context) => HomeScreen()},
      ),
    ),
  );
}
