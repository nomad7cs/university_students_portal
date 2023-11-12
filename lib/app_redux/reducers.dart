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

import '../globals.dart' as globals;
import 'actions.dart';

MyAppState appReducer(MyAppState state, action) {
  if (action is NavigateToUrlAction) {
    print('iffffffff');
    List<String> newUrlStack = [action.url, ...state.currentUrlStack];
    print('newUrlStack:');
    print(newUrlStack);
    print('state.currentUrlStack');
    print(state.currentUrlStack);
    print('globals.store.state.currentUrlStack:');
    print(globals.store.state.currentUrlStack);
    return MyAppState(currentUrl: action.url, currentUrlStack: newUrlStack);
  }

  print('nottttt  iffffffff');

  return state;
}
