import 'package:flutter/material.dart';

import '../../../core/constants/theme/textstyles/textstyle.dart';

PreferredSizeWidget appBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.white,
    title: Text(
      title,
      style: AppTextStyleTheme.appBarText,
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: CircleAvatar(
          radius: 16,
          child: Icon(
            Icons.person_sharp,
            size: 20,
          ),
        ),
      ),
    ],
  );
}
