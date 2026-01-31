import '../entity/advice_entity.dart';

abstract class AdviceRepo {
  Future<AdviceEntity> generateAdvice();
}
