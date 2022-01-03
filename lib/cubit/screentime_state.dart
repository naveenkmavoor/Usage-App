part of 'screentime_cubit.dart';

@immutable
abstract class ScreentimeState {}
//two states for the screen time

//one for the initial state
class ScreentimeInitial extends ScreentimeState {}

//one for the loading state
//when screentimeLoading is not loaded show circular progress indicator
class ScreentimeLoaded extends ScreentimeState {
  final ScreenTime screenTimes;

  ScreentimeLoaded({required this.screenTimes});
}
