class AdviceEntity {
  int id;
  String advice;

  AdviceEntity({required this.id, required this.advice});

  @override
  String toString() {
    return "Advice: id: $id, advice: $advice";
  }
}
