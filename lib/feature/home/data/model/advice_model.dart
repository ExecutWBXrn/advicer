import '../../domain/entity/advice_entity.dart';

class AdviceModel {
  final int id;
  final String advice;

  AdviceModel({required this.id, required this.advice});

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      id: json['slip']['id'] as int,
      advice: json['slip']['advice'] as String,
    );
  }

  AdviceEntity toEntity() {
    return AdviceEntity(id: id, advice: advice);
  }
}
