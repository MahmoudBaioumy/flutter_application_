import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_/core/Network/local_storage.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/features/upload_page/upload_view.dart';
import 'package:gap/gap.dart';

class Home_heder extends StatefulWidget {
  const Home_heder({super.key});

  @override
  State<Home_heder> createState() => _Home_hederState();
}

class _Home_hederState extends State<Home_heder> {
  String? Name;
  String? path;

  @override
  void initState() {
    super.initState();
    AppLocal.getCachedData(AppLocal.IMAGE_KEY).then((value) {
      setState(() {
        path = value;
      });
      AppLocal.getCachedData(AppLocal.NAME_KEY).then((value) {
        setState(() {
          name = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hallo, $name',
              style: getTitelstyle(color: appcolors.lemonada),
            ),
            const Gap(5),
            Text(
              'Have a nice day',
              style: getsmallstyle(
                color: appcolors.whitcolor,
              ),
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          // onTap: () {
          //   push(context, const profile_view());
          // },
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                maxRadius: 28,
              ),
              CircleAvatar(
                maxRadius: 25,
                backgroundImage: path != null
                    ? FileImage(File(path!)) as ImageProvider
                    : const AssetImage('assets/user.png'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
