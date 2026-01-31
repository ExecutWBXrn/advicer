import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entity/advice_entity.dart';
import '../notifiers/advice_async_notifier.dart';

final adviceAsyncNotifierProvider =
    AsyncNotifierProvider<AdviceAsyncNotifier, AdviceEntity>(
      AdviceAsyncNotifier.new,
    );
