import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/data/models/screenTime.dart';
import 'package:task/data/repository.dart';

part 'screentime_state.dart';

class ScreentimeCubit extends Cubit<ScreentimeState> {
  final Repository repository;
  ScreentimeCubit({required this.repository}) : super(ScreentimeInitial());

  void getScreenTime() {
    repository
        .fetchParameters()
        .then((value) => emit(ScreentimeLoaded(screenTimes: value)));
  }
}
