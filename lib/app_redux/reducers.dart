// Create a Reducer. A reducer is a pure function that takes the
// current State (int) and the Action that was dispatched. It should
// combine the two into a new state without mutating the state passed
// in! After the state is updated, the store will emit the update to
// the `onChange` stream.
//
// Because reducers are pure functions, they should not perform any
// side-effects, such as making an HTTP request or logging messages
// to a console. For that, use Middleware.
import 'package:univ_port_app/app_redux/app_state.dart';

import 'actions.dart';

MyAppState appReducer(MyAppState state, action) {
  if (action is NavigateToUrlAction) {
    List<String> newUrlStack = [...state.currentUrlStack, action.url];
    return MyAppState(currentUrl: action.url, currentUrlStack: newUrlStack);
  }

  return state;
}
