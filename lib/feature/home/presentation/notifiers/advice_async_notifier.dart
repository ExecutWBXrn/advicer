import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entity/advice_entity.dart';
import '../../domain/repo/advice_repo.dart';
import '../../domain/usecases/generate_advice_usecase.dart';
import '../providers/providers.dart';

class AdviceAsyncNotifier extends AsyncNotifier<AdviceEntity> {
  late final AdviceRepo _repository;
  late final GenerateAdviceUsecase _generateAdviceUsecase;

  @override
  FutureOr<AdviceEntity> build() async {
    _repository = ref.read(adviceRepoProvider);
    _generateAdviceUsecase = GenerateAdviceUsecase(_repository);
    return AdviceEntity(id: 0, advice: "Here will be your advise");
  }

  Future<void> newAdvice() async {
    state = AsyncLoading();
    try {
      final entity = await _generateAdviceUsecase();
      state = AsyncData(entity);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
