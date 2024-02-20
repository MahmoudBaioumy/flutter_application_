import 'package:flutter/material.dart';
import 'package:flutter_application_/core/function/routing.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/features/source/viwe_dei/CNN_view.dart';
import 'package:flutter_application_/features/source/viwe_dei/Espn_View.dart';
import 'package:flutter_application_/features/source/viwe_dei/sky_view.dart';
import 'package:flutter_application_/features/source/widget/Container_build.dart';
import 'package:gap/gap.dart';

class source extends StatefulWidget {
  const source({super.key});

  @override
  State<source> createState() => _sourceState();
}

class _sourceState extends State<source> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sources',
          style: getTitelstyle(color: appcolors.whitcolor),
        ),
        centerTitle: true,
      ),
      //grade view
      body: GridView.count(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        crossAxisCount: 2,
        children: <Widget>[
          const containerbuild(),
          InkWell(
            onTap: () {
              push(context, const SkyNews());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: appcolors.containerBg,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/SKY.png',
                    fit: BoxFit.cover,
                    height: 125,
                  ),
                  const Gap(10),
                  Text(
                    'SKY NEWS',
                    style: getTitelstyle(color: appcolors.whitcolor),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              push(context, const Espn_View());
            },
            child: Container(
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
                    'ESPN Sport',
                    style: getTitelstyle(color: appcolors.whitcolor),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              push(context, const CCN_view());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: appcolors.containerBg,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/CNN.png',
                    fit: BoxFit.cover,
                    height: 125,
                  ),
                  const Gap(10),
                  Text(
                    'CNN NEWS',
                    style: getTitelstyle(color: appcolors.whitcolor),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
