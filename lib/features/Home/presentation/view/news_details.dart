import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/core/widget/customBu.dart';
import 'package:flutter_application_/features/Home/data/news_model/article.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.model});
  final Article model;
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(model.url ?? ''))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: appcolors.whitcolor,
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(
            foregroundColor: appcolors.Scaffoldbag,
            background: appcolors.lemonada,
            text: 'Go To Website',
            onPressed: () {
              _launchUrl();
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                model.urlToImage ?? '',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    model.title ?? '',
                    style: getTitelstyle(color: appcolors.whitcolor),
                  ),
                ),
              ],
            ),
            const Gap(15),
            Row(
              children: [
                Text(
                  model.author ?? '',
                  style: getbodystyle(color: appcolors.whitcolor),
                ),
              ],
            ),
            const Gap(15),
            Row(
              children: [
                Text(
                  model.publishedAt?.split('T')[0] ?? '',
                  style: getsmallstyle(color: Colors.white38),
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    model.description ?? '',
                    style: getbodystyle(color: appcolors.whitcolor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
