import 'dart:convert';

import 'package:task/data/models/screenTime.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static const url = 'https://api.mocklets.com/p68289/screentime';

  Future<ScreenTime> fetchScreenTimeParameters() async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode >= 400) {
        throw ('Failed to load data');
      }
      final val = json.decode(response.body);
      final screenTimeList = val.map((e) => ScreenTime.fromJson(e)).toList();
      return screenTimeList[0];
    } catch (err) {
      throw ('Failed to load data');
    }
  }
}
