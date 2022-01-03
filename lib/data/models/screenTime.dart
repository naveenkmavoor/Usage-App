import 'package:task/data/models/chartData.dart';
import 'package:task/data/models/deviceUsage.dart';

class ScreenTime {
  final int freeTimeMaxUsage;
  final ChartData chartData;
  final DeviceUsage deviceUsage;

  ScreenTime(
      {required this.freeTimeMaxUsage,
      required this.deviceUsage,
      required this.chartData});

  ScreenTime.fromJson(dynamic json)
      : freeTimeMaxUsage = int.parse(json['freeTimeMaxUsage']!),
        chartData = ChartData.fromJson(json['chartData']),
        deviceUsage = DeviceUsage.fromJson(json['deviceUsage']);
}
