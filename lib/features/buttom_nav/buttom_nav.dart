import 'package:flutter/material.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/features/Home/Home_view.dart';
import 'package:flutter_application_/features/profile/profile.dart';
import 'package:flutter_application_/features/search/search_view.dart';
import 'package:flutter_application_/features/source/source_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottom_nav extends StatefulWidget {
  const bottom_nav({super.key});

  @override
  State<bottom_nav> createState() => _bottom_navState();
}

int _index = 0;
List<Widget> Screens = [
  const Homeview(),
  const search(),
  const source(),
  const profile_view()
];

class _bottom_navState extends State<bottom_nav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home.svg'),
              activeIcon: SvgPicture.asset(
                'assets/home.svg',
                colorFilter:
                    ColorFilter.mode(appcolors.lemonada, BlendMode.srcIn),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/search.svg'),
              activeIcon: SvgPicture.asset(
                'assets/search.svg',
                colorFilter:
                    ColorFilter.mode(appcolors.lemonada, BlendMode.srcIn),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/source.svg'),
              activeIcon: SvgPicture.asset(
                'assets/source.svg',
                colorFilter:
                    ColorFilter.mode(appcolors.lemonada, BlendMode.srcIn),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Profile.svg'),
              activeIcon: SvgPicture.asset(
                'assets/Profile.svg',
                colorFilter:
                    ColorFilter.mode(appcolors.lemonada, BlendMode.srcIn),
              ),
              label: '')
        ],
      ),
    );
  }
}
