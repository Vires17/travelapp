import 'package:get/get.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/hotel.dart';
import 'package:travelapp/app/data/models/post.dart';
import 'package:travelapp/app/data/repository/hotel.dart';
import 'package:travelapp/app/data/repository/post.dart';

class DestinationController extends GetxController {
  final Destination destination = Get.arguments;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  RxList<Hotel> _hotelList = List<Hotel>.empty(growable: true).obs;
  List<Hotel> get hotelList => _hotelList;
  set hotelList(value) => _hotelList.value = value;

  RxList<Post> _relatedPostList = List<Post>.empty(growable: true).obs;
  List<Post> get relatedPostList => _relatedPostList;
  set relatedPostList(value) => _relatedPostList.value = value;

  Future loadData() async {
    loading = true;
    hotelList = await HotelRepository.getHotels(destination.id);
    relatedPostList = await PostRepository.getPosts(destination.id);
    loading = false;
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
