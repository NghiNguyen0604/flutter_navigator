enum AppRouteEnum {
  splash,
  login,
  home,
  testdrive,
  request,
  vehicle,
  reservation,
}

extension AppRouteEnumEx on AppRouteEnum {
  String get path => '/$name';
  String get description {
    switch (this) {
      case AppRouteEnum.home:
        return 'Home';
      case AppRouteEnum.testdrive:
        return 'Test Drive';
      case AppRouteEnum.request:
        return 'Request';
      case AppRouteEnum.vehicle:
        return 'Vehicle';
      default:
        return name;
    }
  }
}
