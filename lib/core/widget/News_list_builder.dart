import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:gap/gap.dart';

class NewsLIstBullder extends StatelessWidget {
  const NewsLIstBullder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: appcolors.containerBg,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/rodri.png',
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //titel of news
                    Text(
                      'Man City stay perfect despite Rodri red against Forest',
                      style: getbodystyle(
                          color: appcolors.whitcolor, fontSize: 16),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: appcolors.whitcolor,
                          size: 15,
                        ),
                        const Gap(10),
                        Text(
                          'READ',
                          style: getsmallstyle(
                              color: appcolors.whitcolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
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
    );
  }
}
