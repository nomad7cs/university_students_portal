class AppRoutePath {
  String? currentUrl = '/';
  String? id;
  bool? isUnknown = false;
  // static final paths = <String>[
  //   '/',              //  '/'
  //   '/login',         //  '/login'
  //   '/student/:id',   //  '/student/:id
  // ];

  AppRoutePath({
    this.currentUrl,
    this.id,
    this.isUnknown,
  });
}
