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

class NewsSecoursLIstBullder extends StatelessWidget {
  const NewsSecoursLIstBullder({
    super.key,
    required this.scource,
  });
  final String scource;
  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getNewsBySource(scource);
    return BlocBuilder<NewsCubit, NewsStastes>(
      builder: (context, state) {
        if (state is NewsByScourceErrorState) {
          return Text(state.error);
        } else if (state is NewsByScourceSuccessState) {
          NewsModel scource = state.model;
          return ListView.builder(
            itemCount: scource.articles?.length,
            itemBuilder: (context, index) {
              var ScouurceItem = scource.articles?[index];
              return InkWell(
                onTap: () {
                  push(context, NewsDetails(model: ScouurceItem!));
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
                          ScouurceItem?.urlToImage ?? '',
                          width: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                                color: Colors.red,
                                width: 150,
                                height: 100,
                                child: const Icon(Icons.error));
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ScouurceItem?.title ?? '',
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
                                  style:
                                      getsmallstyle(color: appcolors.whitcolor),
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
