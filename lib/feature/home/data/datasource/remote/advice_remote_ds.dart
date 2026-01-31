import '../../model/advice_model.dart';

abstract class AdviceRemoteDs {
  Future<AdviceModel> generateAdvice();
}
