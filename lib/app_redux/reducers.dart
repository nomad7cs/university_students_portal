// Create a Reducer. A reducer is a pure function that takes the
// current State (int) and the Action that was dispatched. It should
// combine the two into a new state without mutating the state passed
// in! After the state is updated, the store will emit the update to
// the `onChange` stream.
//
// Because reducers are pure functions, they should not perform any
// side-effects, such as making an HTTP request or logging messages
// to a console. For that, use Middleware.
import 'actions.dart';

int appReducer(int state, action) {
  if (action == Actions.goToUrl) {
    return state + 1;
  } else if (action == Actions.navBack) {
    return state - 1;
  }

  return state;
}