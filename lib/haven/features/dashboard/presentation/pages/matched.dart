import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haven/haven/components/buttons/buttons.dart';
import 'package:haven/haven/components/image.dart';
import 'package:haven/haven/components/scaffold.dart';
import 'package:haven/haven/components/texts/texts.dart';
import 'package:haven/haven/core/theme/colors.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../generated/assets.dart';
import 'dashboard.dart';

class Matched extends StatelessWidget {
  const Matched({super.key});

  @override
  Widget build(BuildContext context) {
    return HavenScaffold(
      body: Column(
        children: [
          76.verticalSpace,
          HavenText(text: "CONGRATS! ", fontSize: 24, color: kPrimaryColor500),
          21.verticalSpace,
          MatchedWidget(),
          42.verticalSpace,
          HavenText(text: "You have found a match"),
          10.verticalSpace,
          HavenText(text: "Make the first move by sending her a message"),
          21.verticalSpace,
          HavenButton(
            buttonText: "Send Message",
            color: kPrimaryColor500,
            icon: HavenImage(
              imagePath: Assets.pngsLoveLetter,
              width: 24,
              height: 24,
            ),
          ),
          21.verticalSpace,
          HavenButton(
            buttonText: "Back to Swipes",
            color: kScaffoldBgColorLight,
            textColor: kPrimaryColor500,
            icon: HavenImage(
              imagePath: Assets.pngsBackEmoji,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class MatchedWidget extends StatelessWidget {
  const MatchedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (254 + 120).h,
      width: 1.sw,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(child: SvgPicture.asset(Assets.svgsDottedLineDesign)),

          Positioned(
            top: 170,
            left: 50,
            child: HavenImage(
              imagePath: Assets.imagesImg1,
              width: 165,
              height: 255,
            ),
          ),
          Positioned(
            top: 70,
            right: 50,
            child: HavenImage(
              imagePath: Assets.imagesImg,
              width: 165,
              height: 255,
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: GradientCircle(
              size: 72,
              child: Icon(Ionicons.heart, color: kSecondaryColor, size: 35),
            ),
          ),
        ],
      ),
    );
  }
}
