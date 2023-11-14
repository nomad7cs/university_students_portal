library globals;

import 'package:redux/redux.dart' as redux;

import 'app_redux/app_state.dart';
import 'app_redux/reducers.dart';

// Create the store with our Reducer and Middleware
final reduxStore = redux.Store<MyAppState>(
  appReducer,
  initialState: MyAppState(currentUrl: '/', currentUrlStack: ['/']),
  // middleware: [loggingMiddleware],
);
