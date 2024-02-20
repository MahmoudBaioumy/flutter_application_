import 'package:flutter/material.dart';
import 'package:flutter_application_/core/Network/local_storage.dart';
import 'package:flutter_application_/core/function/routing.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/features/Home/presentation/buttom_nav/buttom_nav.dart';
import 'package:flutter_application_/features/upload_page/upload_view.dart';
import 'package:gap/gap.dart';

class Splash_View extends StatefulWidget {
  const Splash_View({super.key});

  @override
  State<Splash_View> createState() => _SplashViewState();
}

class _SplashViewState extends State<Splash_View> {
  late bool isUpload;
  @override
  void initState() {
    super.initState();
    AppLocal.getCachedData(AppLocal.ISUPLOAD_KEY).then((value) {
      isUpload = value ?? false;
    });
    Future.delayed(const Duration(seconds: 3), () {
      pushwithReplacement(
          context, isUpload ? const bottom_nav() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 300,
            ),
            const Gap(10),
            Text(
              'Insights News',
              style: getTitelstyle(color: appcolors.whitcolor),
            ),
            const Gap(10),
            Text(
              'Stay Informed, Anytime, Anywhere.',
              style: getsmallstyle(),
            ),
          ],
        ),
      ),
    );
  }
}
