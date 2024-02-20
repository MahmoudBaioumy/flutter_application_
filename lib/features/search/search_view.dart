import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/core/widget/News_list_builder.dart';
import 'package:flutter_application_/features/Home/view_model/home_cubit.dart';
import 'package:flutter_application_/features/search/widget/search_list_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            onChanged: (value) {
               context.read<NewsCubit>().getBysearch(value);
            },
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
          const Gap(15),
          const Expanded(
            child: SearchLIstBullder(),
          )
        ]),
      ),
    );
  }
}
