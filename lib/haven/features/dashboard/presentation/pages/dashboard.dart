import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HavenImage(imagePath: Assets.pngsReject, width: 54, height: 54),
              HavenImage(imagePath: Assets.pngsMatch, width: 72, height: 72),
              HavenImage(imagePath: Assets.pngsMessage, width: 54, height: 54),
            ],
          ),
          39.verticalSpace,
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class GradientCircle extends StatelessWidget {
  final Widget child;
  final double size;
  final Color firstColor, secondColor;
  final double firstStop, secondStop;

  const GradientCircle({
    super.key,
    required this.child,
    required this.size,
    this.firstColor = kSecondaryColor,
    this.secondColor = kPrimaryColor,
    this.firstStop = 0.5,
    this.secondStop = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [firstColor, secondColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [firstStop, secondStop],
        ),
      ),
      child: child,
    );
  }
}
