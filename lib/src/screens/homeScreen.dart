import 'package:all_news/src/configs/colors.dart';
import 'package:all_news/src/controllers/allNewsChannelController.dart';
import 'package:all_news/src/widgets/customAppBar.dart';
import 'package:all_news/src/widgets/customGridView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AllNewsChannelController newsChannelController =
      Get.put(AllNewsChannelController());
  final String title;
  HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: title, actions: false, isCenter: true),
        body: Obx(() => newsChannelController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.darkBlue,
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount:
                    newsChannelController.allNewsChannelModel!.sources!.length,
                itemBuilder: (context, index) {
                  return CustomGridView(
                    channelName: newsChannelController
                        .allNewsChannelModel!.sources![index].name
                        .toString(),
                    channelDesc: newsChannelController
                        .allNewsChannelModel!.sources![index].description
                        .toString(),
                    sourceChannel: newsChannelController
                        .allNewsChannelModel!.sources![index].id
                        .toString(),
                  );
                },
              )));
  }
}
