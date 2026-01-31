import 'package:adviser/feature/home/domain/entity/advice_entity.dart';

import '../../domain/repo/advice_repo.dart';
import '../datasource/remote/advice_remote_ds.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDs _adviceRemoteDs;

  AdviceRepoImpl(this._adviceRemoteDs);

  @override
  Future<AdviceEntity> generateAdvice() async {
    final model = await _adviceRemoteDs.generateAdvice();
    return model.toEntity();
  }
}
