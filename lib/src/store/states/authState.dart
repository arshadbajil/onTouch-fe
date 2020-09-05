import 'package:meta/meta.dart';
import 'package:on_touch/src/Models/EndCustomerModal.dart';

@immutable
class AuthState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;
  final dynamic userData;

  AuthState({this.isError, this.isLoading, this.isSuccess, this.userData});

  factory AuthState.initial() => AuthState(
      isLoading: false, isError: false, isSuccess: false, userData: null);

  AuthState copyWith(
      {@required bool isError,
      @required bool isLoading,
      @required bool isSuccess,
      @required EndCustomerModal user}) {
    return AuthState(
        isError: isError ?? this.isError,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        userData: userData ?? this.userData);
  }
}
