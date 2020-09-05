import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:on_touch/src/Models/EndCustomerModal.dart';
import 'package:on_touch/src/store/states/authState.dart';
import 'package:on_touch/src/store/store.dart';

import 'package:on_touch/src/Services/Auth/authApi.dart';

@immutable
class SetAuthStatesAction {
  final AuthState userState;

  SetAuthStatesAction(this.userState);
}

Future<void> fetchUserInfoAction(
    Store<AppState> store, String email, String password) async {
  store.dispatch(SetAuthStatesAction(AuthState(isLoading: true)));
  try {
    final response = onLogginIn(email, password);
    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    store.dispatch(
      SetAuthStatesAction(
        AuthState(
          isLoading: false,
          userData: EndCustomerModal.listFromJson(jsonData),
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetAuthStatesAction(AuthState(isLoading: false)));
  }
}

Future<void> onUserSignUp(
    Store<AppState> store,
    String mobile,
    String firstname,
    String email,
    String password,
    String confirmPassword) async {
  store.dispatch(SetAuthStatesAction(AuthState(isLoading: true)));
  try {
    final response =
        onSignUp(firstname, mobile, email, password, confirmPassword);
    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    store.dispatch(
      SetAuthStatesAction(
        AuthState(
          isLoading: false,
          userData: EndCustomerModal.listFromJson(jsonData),
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetAuthStatesAction(AuthState(isLoading: false)));
  }
}
