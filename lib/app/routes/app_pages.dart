import 'package:get/get.dart';

import '../modules/chatbot/bindings/chatbot_binding.dart';
import '../modules/chatbot/views/chatbot_view.dart';
import '../modules/destination/bindings/destination_binding.dart';
import '../modules/destination/views/destination_view.dart';
import '../modules/destination_list/bindings/destination_list_binding.dart';
import '../modules/destination_list/views/destination_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hotel_details/bindings/hotel_details_binding.dart';
import '../modules/hotel_details/views/hotel_details_view.dart';
import '../modules/hotels_list/bindings/hotels_list_binding.dart';
import '../modules/hotels_list/views/hotels_list_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/option/bindings/option_binding.dart';
import '../modules/option/views/option_view.dart';
import '../modules/post_details/bindings/post_details_binding.dart';
import '../modules/post_details/views/post_details_view.dart';
import '../modules/posts_list/bindings/posts_list_binding.dart';
import '../modules/posts_list/views/posts_list_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/restaurant_details/bindings/restaurant_details_binding.dart';
import '../modules/restaurant_details/views/restaurant_details_view.dart';
import '../modules/restaurants_list/bindings/restaurants_list_binding.dart';
import '../modules/restaurants_list/views/restaurants_list_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

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
    GetPage(
      name: _Paths.CHATBOT,
      page: () => ChatbotView(),
      binding: ChatbotBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_DETAILS,
      page: () => RestaurantDetailsView(),
      binding: RestaurantDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.DESTINATION_LIST,
      page: () => DestinationListView(),
      binding: DestinationListBinding(),
    ),
    GetPage(
      name: _Paths.POSTS_LIST,
      page: () => PostsListView(),
      binding: PostsListBinding(),
    ),
    GetPage(
      name: _Paths.HOTELS_LIST,
      page: () => HotelsListView(),
      binding: HotelsListBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANTS_LIST,
      page: () => RestaurantsListView(),
      binding: RestaurantsListBinding(),
    ),
  ];
}
