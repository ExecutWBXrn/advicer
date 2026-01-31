import 'dart:convert';

import 'package:adviser/feature/home/data/model/advice_model.dart';

import './advice_remote_ds.dart';
import 'package:dio/dio.dart';

class AdviceRemoteDsImpl implements AdviceRemoteDs {
  final Dio _dio;

  AdviceRemoteDsImpl(this._dio);

  @override
  Future<AdviceModel> generateAdvice() async {
    try {
      final response = await _dio.get('');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> decodedJson = jsonDecode(response.data);
        final model = AdviceModel.fromJson(decodedJson);
        return model;
      } else {
        throw DioException.badResponse(
          statusCode: response.statusCode!,
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e, st) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e,
        message: e.message,
      );
    }
  }
}
