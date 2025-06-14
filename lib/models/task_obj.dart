class TaskObj {
  String? title;
  DateTime? endDate;
  int? difficulty;
  String? description;
  bool isDone = false;

  TaskObj({
    required this.title,
    required this.endDate,
    required this.difficulty,
    required this.description,
    required this.isDone,
  });

  factory TaskObj.fromFirestore(Map<String, dynamic> data) {
    return TaskObj(
      title: data["title"],
      endDate: data["endDate"].toDate(),
      difficulty: data["difficulty"],
      description: data["description"],
      isDone: data["isDone"],
    );
  }
}
