import 'package:adviser/feature/home/domain/entity/advice_entity.dart';

import '../repo/advice_repo.dart';

class GenerateAdviceUsecase {
  final AdviceRepo _repository;

  GenerateAdviceUsecase(this._repository);

  Future<AdviceEntity> call() async {
    return await _repository.generateAdvice();
  }
}
