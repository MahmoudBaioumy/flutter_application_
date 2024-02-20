import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/core/widget/News_list_builder.dart';
import 'package:flutter_application_/features/Home/widget/Home_header.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int pageindex = 0;
  @override
  final List carouselimages = [
    'assets/ccn.jpg',
    'assets/sport.jpg',
    'assets/weather.jpg',
    'assets/shy.jpg',
    'assets/shy2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              const Home_heder(),
              const Gap(20),

              ///to build the image from one temp
              ///// it's a pacName is CarouselSlider
              CarouselSlider.builder(
                  itemCount: carouselimages.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ClipRRect(
                        // this is the temp is build and the count //
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          carouselimages[itemIndex],
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                  //// this is the options in CarouselSlider can use //
                  options: CarouselOptions(
                    height: 150,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageindex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  )),
              const Gap(10),

              // this to build the dot under the image//
              SmoothPageIndicator(
                  controller:
                      PageController(initialPage: pageindex), // PageController
                  count: 5,
                  effect: ScrollingDotsEffect(
                      activeDotColor: appcolors.lemonada,
                      dotHeight: 9,
                      dotWidth: 9,
                      dotColor: appcolors.containerBg), // your preferred effect
                  onDotClicked: (index) {}),
              const Gap(10),
              // Customize the appearance and behavior of the tab bar
              ButtonsTabBar(
                backgroundColor: appcolors.lemonada,
                borderWidth: 2,
                buttonMargin: const EdgeInsets.only(left: 10),
                borderColor: Colors.black,
                labelStyle: getbodystyle(color: Colors.black),
                unselectedBackgroundColor: appcolors.containerBg,
                unselectedLabelStyle: getbodystyle(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                // Add your tabs here
                tabs: const [
                  Tab(
                    text: 'Science',
                  ),
                  Tab(
                    text: 'Entertainment',
                  ),
                  Tab(
                    text: 'Sports',
                  ),
                  Tab(
                    text: 'Business',
                  ),
                ],
              ),
              const Gap(10),
              const Expanded(
                  child: TabBarView(children: [
                //to build the cliprat the titel and image the news by category
                NewsListBuilder(category: 'Science'),
                NewsListBuilder(category: 'Entertainment'),
                NewsListBuilder(category: 'Sports'),
                NewsListBuilder(category: 'Business'),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
