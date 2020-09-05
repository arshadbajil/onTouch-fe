import 'package:on_touch/src/store/actions/auth.dart';
import 'package:on_touch/src/store/states/authState.dart';

onUserLoggin(AuthState prevState, SetAuthStatesAction action) {
  final payload = action.userState;
  return prevState.copyWith(
      isError: payload.isError,
      isLoading: payload.isLoading,
      user: payload.userData,
      isSuccess: payload.isSuccess);
}
