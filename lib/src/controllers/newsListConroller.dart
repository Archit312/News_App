import 'dart:convert';

import 'package:all_news/src/models/newsListModel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsChannelController extends GetxController {
  final isLoading = false.obs;
  NewsChannelModel? newsChannelModel;
  final String sourceChannel;
  NewsChannelController(this.sourceChannel);

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?sources=$sourceChannel&apiKey=41289ada82bd4977b49a9b41ac02a077'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        newsChannelModel = NewsChannelModel.fromJson(result);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error fetching data');
      }
    } finally {
      isLoading(false);
    }
  }
}
