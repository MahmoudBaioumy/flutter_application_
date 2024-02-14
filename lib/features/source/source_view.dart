import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
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
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          const containerbuild(),
          Container(
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
                  'SKY NEWS',
                  style: getTitelstyle(color: appcolors.whitcolor),
                )
              ],
            ),
          ),
          Container(
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
                  'ESPN NEWS',
                  style: getTitelstyle(color: appcolors.whitcolor),
                )
              ],
            ),
          ),
          Container(
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
                  'CNN NEWS',
                  style: getTitelstyle(color: appcolors.whitcolor),
                )
              ],
            ),
          ),
          Container(
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
          ),
          Container(
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
                  'SKY NEWS',
                  style: getTitelstyle(color: appcolors.whitcolor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
