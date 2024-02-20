import 'package:flutter/material.dart';
import 'package:flutter_application_/core/function/routing.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/features/Home/data/news_model/news_model.dart';
import 'package:flutter_application_/features/Home/presentation/view/news_details.dart';
import 'package:flutter_application_/features/Home/view_model/home_cubit.dart';
import 'package:flutter_application_/features/Home/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';


class NewsListBuilder extends StatelessWidget {
  const NewsListBuilder({
    super.key,
    required this.category,
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getByCategory(category);
    return BlocBuilder<NewsCubit, NewsStastes>(
      builder: (context, state) {
        if (state is NewsByCategoryErrorState) {
          return Text(state.error);
        } else if (state is NewsByCategorySuccessState) {
          NewsModel news = state.model;
          return ListView.builder(
            itemCount: news.articles?.length,
            itemBuilder: (context, index) {
              var newsItem = news.articles?[index];
              return InkWell(
                onTap: () {
                  push(context, NewsDetails(model: newsItem!));
                },
                child: Container(
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
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
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
                                  style: getsmallstyle(color: appcolors.whitcolor),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}