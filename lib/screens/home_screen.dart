import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adviser/blogic/adviceService_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Advice adviceState = ref.watch(adviceProvider);
    final AdviceNotifier adviceNotifier = ref.read(adviceProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADVISE GENERATOR",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.white,
                blurRadius: 50,
                offset: Offset(-60, 0),
              ),
              Shadow(
                color: Colors.white,
                blurRadius: 50,
                offset: Offset(60, 0),
              ),
              Shadow(color: Colors.white, blurRadius: 50),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade900,
      ),
      backgroundColor: Colors.deepPurpleAccent.shade700,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ADVISE:",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    shadows: [
                      const Shadow(
                        color: Colors.purpleAccent,
                        blurRadius: 15,
                        offset: Offset(-2.5, 2.5),
                      ),
                      Shadow(
                        color: Colors.pink.shade800,
                        blurRadius: 15,
                        offset: Offset(2.5, -2.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  adviceState.advice == null
                      ? "Here will be your advise"
                      : adviceState.advice!,
                  maxLines: 100,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(color: Colors.purpleAccent, blurRadius: 15),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    adviceNotifier.newAdvice();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.blue.shade800,
                    ),
                  ),
                  child: const Text(
                    "GENERATE ADVISE",
                    style: TextStyle(
                      color: Colors.black,
                      shadows: [Shadow(color: Colors.white, blurRadius: 50)],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
