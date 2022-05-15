import 'package:get/get.dart';
import 'package:travelapp/app/data/models/hotel.dart';
import 'package:travelapp/app/data/repository/hotel.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailsController extends GetxController {
  final Hotel hotel = Get.arguments;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  RxList<Hotel> _relatedHotelList = List<Hotel>.empty(growable: true).obs;
  List<Hotel> get relatedHotelList => _relatedHotelList;
  set relatedHotelList(value) => _relatedHotelList.value = value;

  Future loadData() async {
    loading = true;
    relatedHotelList = await HotelRepository.getHotels(hotel.destination!.id);
    loading = false;
  }

  Future<void> dialCall() async {
    String phoneNumber = hotel.phoneNumber ?? '';
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
    String emailAddress = hotel.contactEmail ?? '';
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
    String facebook = hotel.facebookLink ?? '';
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
