import 'package:all_news/src/configs/colors.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar({
  required String title,
  bool? isCenter,
  bool? actions,
}) {
  return PreferredSize(
      preferredSize: Size(double.infinity, 50),
      child: AppBar(
        title: Text(title),
        centerTitle: isCenter,
        backgroundColor: AppColor.darkBlue,
        foregroundColor: AppColor.white,
        actions: actions == true ? [] : [],
      ));
}
