import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/post.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/data/repository/post.dart';

class PostsListController extends GetxController {
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Rx<User> _currentUser = User().obs;
  User get currentUser => _currentUser.value;
  set currentUser(value) => _currentUser.value = value;

  RxList<Post> _postList = List<Post>.empty(growable: true).obs;
  List<Post> get postList => _postList;
  set postList(value) => _postList.value = value;

  Future loadData() async {
    loading = true;
    currentUser = await StorageHelper.getUserFromStorage();
    postList = await PostRepository.getPosts();
    // currentAddress = addressList[0];
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
