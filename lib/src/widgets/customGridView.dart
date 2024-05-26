import 'package:all_news/src/configs/colors.dart';
import 'package:all_news/src/screens/channelNewsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridView extends StatelessWidget {
  final String channelName;
  final String channelDesc;
  final String sourceChannel;
  const CustomGridView(
      {super.key,
      required this.channelName,
      required this.channelDesc,
      required this.sourceChannel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: InkWell(
        onTap: () {
          Get.to(ChannelNewsScreen(
            title: channelName,
            sourceChannel: sourceChannel,
          ));
        },
        child: GridTile(
          child: Card(
            borderOnForeground: true,
            color: AppColor.lightBlue,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 9.0),
                  child: Text(
                    channelName,
                    style: const TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkBlue,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 9.0),
                  child: Text(
                    channelDesc,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: AppColor.darkBlue,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
