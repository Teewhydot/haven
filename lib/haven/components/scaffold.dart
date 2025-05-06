import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haven/haven/core/theme/colors.dart';

import '../../generated/assets.dart';

class HavenScaffold extends StatelessWidget {
  final Widget body;
  final double padding;

  const HavenScaffold({super.key, required this.body, this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(padding: EdgeInsets.all(padding).r, child: body),
        ),
        Positioned(bottom: 20, left: 55, right: 55, child: HavenNavBar()),
      ],
    );
  }
}

class HavenNavBar extends StatelessWidget {
  const HavenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: kScaffoldBgColorLight,
        borderRadius: BorderRadius.circular(90),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(Assets.svgsCards, height: 22, width: 22),
          SvgPicture.asset(Assets.svgsHearts, height: 22, width: 22),
          SvgPicture.asset(Assets.svgsChatIcon1, height: 22, width: 22),
          SvgPicture.asset(
            Assets.svgsProfile,
            color: kPrimaryColor500,
            height: 22,
            width: 22,
          ),
        ],
      ),
    );
  }
}
