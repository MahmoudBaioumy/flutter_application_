import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/core/widget/News_list_builder.dart';
import 'package:gap/gap.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Your News',
          style: getTitelstyle(fontSize: 17, color: appcolors.whitcolor),
        ),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
          style: getbodystyle(),
          decoration: const InputDecoration(
              hintText: 'Search for news',
              hintStyle: TextStyle(color: Colors.white38),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white38,
                size: 30,
              )),
        ),
        const Gap(15),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Total Results : 10',
            style: getbodystyle(),
          ),
        ),
        const Gap(15),
        const Expanded(
          child: NewsLIstBullder(),
        )
      ]),
    );
  }
}
