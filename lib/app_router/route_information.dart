class AppRoutePath {
  // final List<String> currentList;
  // final int currentPage;
  String currentUrl = '/';
  String? id;
  bool isUnknown = false;
  static final paths = <String>[
    // '',             //  '/'
    'login',        //  '/login'
    'student',      //  '/student/:id
  ];

  AppRoutePath();

  // AppRoutePath.home()
  //   : isUnknown = false;

  AppRoutePath.student(String this.id) {
    isUnknown = false;
    currentUrl = '/student/$id';
  }


  AppRoutePath.unknown()
    : id = null,
      isUnknown = true;

  /*AppRoutePath.home()
      : id = null,
        isUnknown = false;

  AppRoutePath.details(this.id) : isUnknown = false;

  AppRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;*/
}

/*
class AppRouteInformation {
  final List<String> currentList;
  final int currentPage;

  AppRouteInformation(this.currentList, this.currentPage);
}*/
