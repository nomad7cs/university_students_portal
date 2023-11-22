library globals;

import 'package:redux/redux.dart' as redux;
import 'package:univ_port_app/app_redux/middlewares.dart';

import 'app_redux/app_state.dart';
import 'app_redux/reducers.dart';

// Create the store with our Reducer and Middleware
final reduxStore = redux.Store<MyAppState>(
  appReducer,
  initialState: MyAppState(currentUrl: '/login', currentUrlStack: ['/login']),
  middleware: [fetchTodosMiddleware],
);
