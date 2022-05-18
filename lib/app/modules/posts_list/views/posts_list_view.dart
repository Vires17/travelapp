import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/custom_loader.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/chatbot_button.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/modules/posts_list/views/components/post_list.dart';

import '../controllers/posts_list_controller.dart';

class PostsListView extends GetView<PostsListController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: TravelAppBar(
        onPress: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      floatingActionButton: chatbot,
      drawer: buildDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: RefreshIndicator(
            onRefresh: () => controller.loadData(),
            child: Obx(
              () {
                if (controller.loading == true) {
                  return LoadingScreen(height: size.height);
                }
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                  width: size.width,
                  child: Column(
                    children: [
                      PostList(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyDrawer(screenContext: context);
  }
}
