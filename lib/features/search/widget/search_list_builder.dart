import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/features/Home/data/news_model/news_model.dart';
import 'package:flutter_application_/features/Home/view_model/home_cubit.dart';
import 'package:flutter_application_/features/Home/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchLIstBullder extends StatelessWidget {
  const SearchLIstBullder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStastes>(
      builder: (context, state) {
        if (state is NewsBySearchErrorState) {
          return Text(state.error);
        } else if (state is NewsBySearchSuccessState) {
          NewsModel news = state.model;
          return Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Total Results : ${news.articles?.length}',
                      style: getTitelstyle(
                          color: appcolors.whitcolor, fontSize: 17),
                    ),
                  ],
                ),
                const Gap(15),
                Expanded(
                  child: ListView.builder(
                    itemCount: news.articles?.length,
                    itemBuilder: (context, index) {
                      var newsItem = news.articles?[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            color: appcolors.containerBg,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                newsItem?.urlToImage ?? '',
                                width: 150,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox(
                                      width: 150, child: Icon(Icons.error));
                                },
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsItem?.title ?? '',
                                    style: getbodystyle(fontSize: 14),
                                  ),
                                  const Gap(10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.menu,
                                        size: 14,
                                        color: appcolors.whitcolor,
                                      ),
                                      const Gap(7),
                                      Text(
                                        'Read',
                                        style: getsmallstyle(
                                            color: appcolors.whitcolor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
