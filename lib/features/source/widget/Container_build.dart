import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:gap/gap.dart';
class containerbuild extends StatelessWidget {
  const containerbuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: appcolors.containerBg,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Image.asset(
            'assets/image 2.png',
            fit: BoxFit.cover,
            height: 125,
          ),
          const Gap(10),
          Text(
            'BBC NEWS',
            style: getTitelstyle(color: appcolors.whitcolor),
          )
        ],
      ),
    );
  }
}