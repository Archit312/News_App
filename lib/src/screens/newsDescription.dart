import 'package:all_news/src/configs/colors.dart';
import 'package:all_news/src/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDescription extends StatelessWidget {
  final String name;
  final String description;
  final String title;
  final String? imageUrl;
  final String content;
  final String publishedAt;
  final String link;
  const NewsDescription(
      {super.key,
      required this.name,
      required this.description,
      required this.title,
      this.imageUrl,
      required this.content,
      required this.publishedAt,
      required this.link});

  Future<void> inAppView(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: name, isCenter: true, actions: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(imageUrl!),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    content,
                    style: const TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(color: AppColor.skyBlue),
                        ),
                        Text(publishedAt)
                      ]),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      inAppView(link);
                    },
                    child: const Text(
                      "More Details",
                      style: TextStyle(color: AppColor.skyBlue),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
