import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haven/haven/core/theme/colors.dart';
import 'package:ionicons/ionicons.dart';

class HavenScaffold extends StatelessWidget {
  final Widget body;
  final double padding;

  const HavenScaffold({super.key, required this.body, this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HavenNavBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(padding: EdgeInsets.all(padding).r, child: body),
    );
  }
}

class HavenNavBar extends StatelessWidget {
  const HavenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 55).r,
      child: Container(
        height: 44.h,
        width: 1.sw,
        decoration: BoxDecoration(
          color: kScaffoldBgColorLight,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Ionicons.card_sharp, size: 40),
            Icon(Ionicons.card_sharp, size: 40),
            Icon(Ionicons.card_sharp, size: 40),
            Icon(Ionicons.card_sharp, size: 40),
            Icon(Ionicons.card_sharp, size: 40),
          ],
        ),
      ),
    );
  }
}
