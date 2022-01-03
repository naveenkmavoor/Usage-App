class ChartData {
  ChartData({
    required this.totalTime,
    required this.studyTime,
    required this.classTime,
    required this.freeTime,
  });

  int totalTime;
  int studyTime;
  int classTime;
  int freeTime;

  ChartData.fromJson(dynamic json)
      : totalTime = int.parse(json['totalTime']['total']!),
        studyTime = int.parse(json['studyTime']['total']!),
        classTime = int.parse(json['classTime']['total']!),
        freeTime = int.parse(json['freeTime']['total']!);
}
