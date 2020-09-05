import 'package:meta/meta.dart';

@immutable
class AlertState {
  final bool isAlert;
  final bool isALertCompleted;
  final int alertDuration;
  final dynamic alertData;

  AlertState(
      {this.isAlert,
      this.isALertCompleted,
      this.alertDuration,
      this.alertData});

  factory AlertState.initial() => AlertState(
      isAlert: false,
      isALertCompleted: false,
      alertDuration: 3000,
      alertData: null);

  AlertState copyWith(
      {@required bool isAlert,
      @required bool isALertCompleted,
      @required bool alertDuration,
      @required String alertData}) {
    return AlertState(
        isAlert: isAlert ?? this.isAlert,
        isALertCompleted: isALertCompleted ?? this.isALertCompleted,
        alertDuration: alertDuration ?? this.alertDuration,
        alertData: alertData ?? this.alertData);
  }
}
