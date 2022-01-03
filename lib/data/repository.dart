import 'package:task/data/models/screenTime.dart';
import 'package:task/data/network_service.dart';

class Repository {
  final NetworkService networkService;
  Repository({required this.networkService});

  Future<ScreenTime> fetchParameters() async {
    final screenTime = await networkService.fetchScreenTimeParameters();
    return screenTime;
  }
}
