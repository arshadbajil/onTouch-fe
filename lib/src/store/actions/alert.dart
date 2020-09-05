import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:on_touch/src/store/states/alert.dart';
import 'package:on_touch/src/store/store.dart';

@immutable
class SetAlertStateActions {
  final AlertState alertState;

  SetAlertStateActions(this.alertState);
}

Future<void> onAlertRecieved(Store<AppState> store, String alertData) async {
  store.dispatch(
      SetAlertStateActions(AlertState(isAlert: true, alertData: alertData)));
}

Future<void> onAlertCancell(Store<AppState> store) async {
  store.dispatch(SetAlertStateActions(AlertState(isALertCompleted: true)));
}
