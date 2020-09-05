import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:on_touch/src/store/actions/auth.dart';
import 'package:on_touch/src/store/reducers/auth.dart';
import 'package:on_touch/src/store/states/authState.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetAuthStatesAction) {
    final nextPostsState = onUserLoggin(state.user, action);

    return state.copyWith(userState: nextPostsState);
  }

  return state;
}

@immutable
class AppState {
  final AuthState user;

  AppState({
    @required this.user,
  });

  AppState copyWith({
    AuthState userState,
  }) {
    return AppState(
      user: userState ?? this.user,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final useStateInitial = AuthState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(user: useStateInitial),
    );
  }
}
