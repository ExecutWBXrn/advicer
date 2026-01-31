import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// CORE

import 'package:adviser/core/router/router.dart';

void main() {
  runApp(ProviderScope(child: Application()));
}

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(initialRoute: '/', routes: ref.read(routerProvider));
  }
}
