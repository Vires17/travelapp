import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/custom_loader.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/chatbot_button.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/modules/search/views/components/hotels.dart';
import 'package:travelapp/app/modules/search/views/components/new_posts.dart';
import 'package:travelapp/app/modules/search/views/components/nothing.dart';
import 'package:travelapp/app/modules/search/views/components/restaurant.dart';
import 'package:travelapp/app/modules/search/views/components/search.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  SearchView({
    Key? key,
  }) : super(key: key);

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
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
              width: size.width,
              child: Column(
                children: [
                  Search(),
                  Obx(
                    () {
                      if (controller.loading == true) {
                        return LoadingScreen(height: size.height / 3);
                      }
                      return Column(
                        children: [
                          NewPosts(),
                          Hotels(),
                          Restaurants(),
                          Nothing(),
                        ],
                      );
                    },
                  ),
                ],
              ),
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
