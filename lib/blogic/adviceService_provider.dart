import 'dart:convert';
import 'package:adviser/blogic/dio_provider.dart';
import 'package:riverpod/legacy.dart';

class Advice {
  final int? id;
  final String? advice;
  final bool isLoading;

  Advice({this.id, this.advice, this.isLoading = false});

  factory Advice.fromJson(Map<String, dynamic> json) {
    return Advice(
      id: json['slip']['id'] as int,
      advice: json['slip']['advice'],
    );
  }

  Advice newAdvice({String? advice, bool? isLoading}) {
    return Advice(
      advice: advice ?? this.advice,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AdviceNotifier extends StateNotifier<Advice> {
  final DioApiService _dio;

  AdviceNotifier(this._dio) : super(Advice());

  Future<void> newAdvice() async {
    try {
      final response = await _dio.getDio().get('');
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = jsonDecode(response.data);
        final Advice adviceJson = Advice.fromJson(decodedJson);
        state = state.newAdvice(advice: adviceJson.advice);
      } else {
        state = state.newAdvice(advice: "find better wifi connection!");
      }
    } catch (e) {
      print("Error $e");
      state = state.newAdvice(advice: "Connect to network");
    }
  }
}

final adviceProvider = StateNotifierProvider<AdviceNotifier, Advice>((ref) {
  final dioServe = ref.read(dioApiServiceProvider);

  return AdviceNotifier(dioServe);
});
