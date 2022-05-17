import 'package:get/get.dart';
import 'package:travelapp/app/data/models/restaurant.dart';
import 'package:travelapp/app/data/repository/restaurant.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantDetailsController extends GetxController {
  final Restaurant restaurant = Get.arguments;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  RxList<Restaurant> _relatedRestaurantList =
      List<Restaurant>.empty(growable: true).obs;
  List<Restaurant> get relatedRestaurantList => _relatedRestaurantList;
  set relatedRestaurantList(value) => _relatedRestaurantList.value = value;

  Future loadData() async {
    loading = true;
    relatedRestaurantList = await RestaurantRepository.getRestaurants(
        destinationId: restaurant.destination!.id);
    loading = false;
  }

  Future<void> dialCall() async {
    String phoneNumber = restaurant.phoneNumber ?? '';
    if (phoneNumber == '') {
      return;
    }
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> emailRedirect() async {
    String emailAddress = restaurant.contactEmail ?? '';
    if (emailAddress == '') {
      return;
    }
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    await launchUrl(launchUri);
  }

  Future<void> facebookRedirect() async {
    String facebook = restaurant.facebookLink ?? '';
    if (facebook == '') {
      return;
    }
    final Uri launchUri = Uri.parse(facebook);
    await launchUrl(launchUri);
  }

  @override
  void onInit() async {
    await loadData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
