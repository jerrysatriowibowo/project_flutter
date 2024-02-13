part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const BOTTOM_MENU = _Paths.BOTTOM_MENU;
  static const PROFIL = _Paths.PROFIL;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const BOTTOM_MENU = '/bottom-menu';
  static const PROFIL = '/profil';
}
