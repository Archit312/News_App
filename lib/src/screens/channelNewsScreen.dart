import 'package:all_news/src/configs/colors.dart';
import 'package:all_news/src/controllers/newsListConroller.dart';
import 'package:all_news/src/screens/newsDescription.dart';
import 'package:all_news/src/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChannelNewsScreen extends StatelessWidget {
  final String sourceChannel;
  final String title;
  const ChannelNewsScreen(
      {super.key, required this.title, required this.sourceChannel});

  @override
  Widget build(BuildContext context) {
    NewsChannelController newsListController =
        Get.put(NewsChannelController(sourceChannel.toString()));
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(title: title, isCenter: true, actions: false),
      body: Obx(() => newsListController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.darkBlue,
              ),
            )
          : ListView.builder(
              itemCount: newsListController.newsChannelModel!.articles!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 4.0),
                  child: InkWell(
                    onTap: () => Get.to(NewsDescription(
                      name: newsListController
                          .newsChannelModel!.articles![index].source!.name
                          .toString(),
                      title: newsListController
                          .newsChannelModel!.articles![index].title
                          .toString(),
                      content: newsListController
                          .newsChannelModel!.articles![index].content
                          .toString(),
                      description: newsListController
                          .newsChannelModel!.articles![index].description
                          .toString(),
                      imageUrl: newsListController
                          .newsChannelModel!.articles![index].urlToImage
                          .toString(),
                      publishedAt: newsListController
                          .newsChannelModel!.articles![index].publishedAt
                          .toString(),
                      link: newsListController
                          .newsChannelModel!.articles![index].url
                          .toString(),
                    )),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network(
                            newsListController
                                .newsChannelModel!.articles![index].urlToImage
                                .toString(),
                            width: width * 1),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColor.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      newsListController.newsChannelModel!
                                          .articles![index].title
                                          .toString(),
                                      style: const TextStyle(
                                          color: AppColor.darkBlue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        newsListController.newsChannelModel!
                                            .articles![index].source!.name
                                            .toString(),
                                        style: const TextStyle(
                                            color: AppColor.skyBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        newsListController.newsChannelModel!
                                            .articles![index].publishedAt
                                            .toString(),
                                        style: const TextStyle(
                                            color: AppColor.darkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }
}
