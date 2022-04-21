import 'package:get/get.dart';

import '../modules/destination/bindings/destination_binding.dart';
import '../modules/destination/views/destination_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hotel_details/bindings/hotel_details_binding.dart';
import '../modules/hotel_details/views/hotel_details_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/option/bindings/option_binding.dart';
import '../modules/option/views/option_view.dart';
import '../modules/post_details/bindings/post_details_binding.dart';
import '../modules/post_details/views/post_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OPTION,
      page: () => OptionView(),
      binding: OptionBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.POST_DETAILS,
      page: () => PostDetailsView(),
      binding: PostDetailsBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_DETAILS,
      page: () => HotelDetailsView(),
      binding: HotelDetailsBinding(),
    ),
    GetPage(
      name: _Paths.DESTINATION,
      page: () => DestinationView(),
      binding: DestinationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
