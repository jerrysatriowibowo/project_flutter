import 'package:flutter_project/app/modules/pasien/views/create_pasien_view.dart';
import 'package:flutter_project/app/modules/pasien/views/edit_pasien_view.dart';
import 'package:flutter_project/app/modules/pasien/views/show_pasien_view.dart';
import 'package:get/get.dart';
import '../modules/bottom_menu/bindings/bottom_menu_binding.dart';
import '../modules/bottom_menu/views/bottom_menu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pasien/bindings/pasien_binding.dart';
import '../modules/pasien/views/pasien_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () => const BottomMenuView(),
      binding: BottomMenuBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.PASIEN,
      page: () => PasienView(),
      binding: PasienBinding(),
    ),
    GetPage(
      name: _Paths.TambahPasien,
      page: () => TambahPasienView(),
    ),
    GetPage(
      name: _Paths.EditPasien,
      page: () => EditPasienView(pasien: Get.arguments),
    ),
    GetPage(
      name: _Paths.DetailPasien,
      page: () => DetailPasienView(pasien: Get.arguments),
    ),
  ];
}
