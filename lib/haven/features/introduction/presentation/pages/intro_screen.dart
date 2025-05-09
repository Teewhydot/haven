import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:haven/haven/components/buttons/buttons.dart';
import 'package:haven/haven/components/image.dart';
import 'package:haven/haven/components/scaffold.dart';
import 'package:haven/haven/components/texts/texts.dart';
import 'package:haven/haven/core/helpers/extensions.dart';
import 'package:haven/haven/core/services/navigation_service/nav_config.dart';

import '../../../../../generated/assets.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = GetIt.instance<NavigationService>();
    return HavenScaffold(
      padding: 0,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          64.verticalSpace,
          HavenImage(imagePath: Assets.pngsLogo, width: 160, height: 36),
          28.verticalSpace,
          HavenImage(
            imagePath: Assets.imagesOnboarding,
            width: context.screenWidth,
            height: 353.h,
            fit: BoxFit.fill,
          ),
          HavenRichText(
            text: "Find your missing ",
            text2: "puzzle",
            fontSize: 32,
          ),
          HavenRichText(text: "", text2: " piece 💝😍", fontSize: 32),
          16.verticalSpace,
          HavenText(text: "Find the one and share your passions, quirks,"),
          HavenText(text: " and interests with the world."),
          HavenText(text: "Your exciting adventure starts here! 😉"),
          28.verticalSpace,
          HavenButton(
            buttonText: "Get started 😉",
            onPressed: () {
              nav.navigateTo("/login");
            },
          ),
        ],
      ),
    );
  }
}
