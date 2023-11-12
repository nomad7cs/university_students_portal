// Create typed actions. You will dispatch these in order to
// update the state of your application.
// Actions should be simple Enums, or classes if the Action contains payload information.
//
// enum Actions {
// goToUrl,
// navBack,
// }

class NavigateToUrlAction {
  final String url;

  NavigateToUrlAction(this.url);
}

// class GoToUrlSucceededAction {
//   // final String url;
//   //
//   // GoToUrlSucceededAction(this.url);
// }
//
// class GoToUrlFailedAction {
//   final Exception error;
//
//   GoToUrlFailedAction(this.error) {
//   }
// }