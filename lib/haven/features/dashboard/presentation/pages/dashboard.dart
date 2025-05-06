import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haven/haven/components/image.dart';
import 'package:haven/haven/components/scaffold.dart';
import 'package:haven/haven/core/theme/colors.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../generated/assets.dart';
import '../../../../components/texts/texts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return HavenScaffold(
      padding: 17,
      body: Column(
        children: [
          64.verticalSpace,
          Row(
            children: [
              Row(
                children: [
                  HavenImage(imagePath: Assets.pngsPp, width: 44, height: 44),
                  8.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          HavenText(
                            text: "Julia K, 25",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          8.horizontalSpace,
                          Icon(
                            Ionicons.checkmark_circle,
                            size: 20,
                            color: const Color(0xFF4CAF50),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Ionicons.location, size: 14),
                          HavenText(
                            text: "Florence, Italy",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              HavenImage(
                imagePath: Assets.pngsNotification,
                width: 24,
                height: 24,
              ),
            ],
          ),
          24.verticalSpace,
          SwipesWidget(),
          56.verticalSpace,
          Row(
            spacing: 32.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientCircle(
                size: 54,
                bgColor: kSecondaryColor,
                child: Icon(Ionicons.close, size: 22),
              ),
              GradientCircle(size: 72, child: Icon(Ionicons.heart, size: 35)),
              GradientCircle(
                size: 54,
                bgColor: kSecondaryColor,
                child: SvgPicture.asset(
                  Assets.svgsChatIcon,
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SwipesWidget extends StatelessWidget {
  const SwipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage(Assets.imagesUserImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class GradientCircle extends StatelessWidget {
  final Widget child;
  final double size;
  final Color bgColor;

  const GradientCircle({
    super.key,
    required this.child,
    required this.size,
    this.bgColor = kPrimaryColor500,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: bgColor,
      child: child,
    );
  }
}
