import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/generate_advice_notifier_provider.dart';
import '../mapper/dio_failure_to_message_mapper.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adviceState = ref.watch(adviceAsyncNotifierProvider);
    final adviceNotifier = ref.read(adviceAsyncNotifierProvider.notifier);

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
                adviceState.when(
                  data: (adviceEntity) {
                    return Text(
                      adviceState.requireValue.advice,
                      maxLines: 100,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: Colors.purpleAccent, blurRadius: 15),
                        ],
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(
                      mapDioExceptionToMessage(error as DioException),
                      maxLines: 100,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: Colors.purpleAccent, blurRadius: 15),
                        ],
                      ),
                    );
                  },
                  loading: () {
                    return const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    adviceState.isRefreshing
                        ? null
                        : adviceNotifier.newAdvice();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.blue.shade800,
                    ),
                  ),
                  child: adviceState.isRefreshing
                      ? CircularProgressIndicator()
                      : Text(
                          adviceState.hasError
                              ? "ERROR RETRY"
                              : "GENERATE ADVISE",
                          style: TextStyle(
                            color: Colors.black,
                            shadows: [
                              Shadow(color: Colors.white, blurRadius: 50),
                            ],
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
