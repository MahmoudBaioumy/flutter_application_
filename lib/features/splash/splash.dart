import 'package:flutter/material.dart';
import 'package:flutter_application_/core/Network/local_storage.dart';
import 'package:flutter_application_/core/function/routing.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/features/Home/presentation/buttom_nav/buttom_nav.dart';
import 'package:flutter_application_/features/upload_page/upload_view.dart';
import 'package:gap/gap.dart';

class Splash_view extends StatefulWidget {
  const Splash_view({super.key});

  @override
  State<Splash_view> createState() => _Splash_viewState();
}

class _Splash_viewState extends State<Splash_view> {
  @override
  void initState() {
    super.initState();
    late bool isUpload;
    AppLocal.getCachedData(AppLocal.ISUPLOAD_KEY).then((value) {
      isUpload = value ?? false;
    });
    Future.delayed(const Duration(seconds: 4), () {
      pushwithReplacement(
          context, isUpload ? const bottom_nav() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.Scaffoldbag,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/logo.png',
            width: 280,
          ),
          const Gap(5),
          Text(
            'Insights News',
            style: getTitelstyle(color: appcolors.whitcolor, fontSize: 23),
          ),
          const Gap(5),
          Text(
            'Stay Informed, Anytime, Anywhere.',
            style: getsmallstyle(color: Colors.white38),
          )
        ]),
      ),
    );
  }
}
