class DeviceUsage {
  final DeviceUsageTime totalTime;
  final DeviceUsageTime studyTime;
  final DeviceUsageTime classTime;
  final DeviceUsageTime freeTime;

  DeviceUsage({
    required this.totalTime,
    required this.studyTime,
    required this.classTime,
    required this.freeTime,
  });

  DeviceUsage.fromJson(dynamic json)
      : totalTime = DeviceUsageTime.fromJson(json['totalTime']),
        studyTime = DeviceUsageTime.fromJson(json['studyTime']),
        classTime = DeviceUsageTime.fromJson(json['classTime']),
        freeTime = DeviceUsageTime.fromJson(json['freeTime']);
}

class DeviceUsageTime {
  DeviceUsageTime({
    required this.mobile,
    required this.laptop,
  });

  int mobile;
  int laptop;

  DeviceUsageTime.fromJson(dynamic json)
      : mobile = int.parse(json['mobile']!),
        laptop = int.parse(json['laptop']!);
}
