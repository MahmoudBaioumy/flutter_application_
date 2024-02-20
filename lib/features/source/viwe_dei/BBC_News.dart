import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/core/widget/News_list_builder.dart';
import 'package:gap/gap.dart';

class BBC_View extends StatelessWidget {
  const BBC_View({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BBC NEWS',
          style: getTitelstyle(fontSize: 17, color: appcolors.whitcolor),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: appcolors.whitcolor,
            )),
      ),
      body:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Gap(15),
        Expanded(
          child: NewsListBuilder(category: 'Business'),
        )
      ]),
    );
  }
}
