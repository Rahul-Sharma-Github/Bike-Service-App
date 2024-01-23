// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../../../core/constants/theme/textstyles/textstyle.dart';

// Header Widget
class HeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const HeaderWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyleTheme.welcomeHeadingTitleText,
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(subtitle,
                  style: AppTextStyleTheme.welcomeHeadingSubtitleText)
            ],
          ),
        ],
      ),
    );
  }
}
