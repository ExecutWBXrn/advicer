import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adviser/core/providers/dio_provider.dart';
import '../../data/datasource/remote/advice_remote_ds.dart';
import '../../data/datasource/remote/advice_remote_ds_impl.dart';
import '../../data/repo_impl/advice_repo_impl.dart';
import '../../domain/repo/advice_repo.dart';

final adviceDataSourceProvider = Provider<AdviceRemoteDs>(
  (ref) => AdviceRemoteDsImpl(ref.read(dioApiServiceProvider)),
);

final adviceRepoProvider = Provider<AdviceRepo>(
  (ref) => AdviceRepoImpl(ref.read(adviceDataSourceProvider)),
);
