import 'package:get/get.dart';
import 'package:travelapp/app/data/models/post.dart';
import 'package:travelapp/app/data/repository/post.dart';

class PostDetailsController extends GetxController {
  final Post post = Get.arguments;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  RxList<Post> _relatedPostList = List<Post>.empty(growable: true).obs;
  List<Post> get relatedPostList => _relatedPostList;
  set relatedPostList(value) => _relatedPostList.value = value;

  Future loadData() async {
    loading = true;
    print(post.destination!.id);
    relatedPostList =
        await PostRepository.getPosts(destinationId: post.destination!.id);
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
