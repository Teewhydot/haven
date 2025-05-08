import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haven/haven/components/buttons/buttons.dart';
import 'package:haven/haven/components/image.dart';
import 'package:haven/haven/components/scaffold.dart';
import 'package:haven/haven/components/texts/texts.dart';
import 'package:haven/haven/core/theme/colors.dart';

import '../../../../../generated/assets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return HavenScaffold(
      padding: 20,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HavenImage(imagePath: Assets.pngsLogo, width: 160, height: 36),
          100.verticalSpace,
          HavenText(
            text: "Login to your Haven Account",
            fontSize: 24,
            color: kPrimaryColor500,
          ),
          50.verticalSpace,
          HavenText(
            text: "Enter your phone number",
            fontSize: 16,
            color: kPrimaryColor500,
          ),
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: TextField(
              controller: _phoneController,
              cursorHeight: 30,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                border: InputBorder.none, // Removes the underline
                counterText: '', // Hides the character counter
              ),
              keyboardType: TextInputType.number,
              maxLength: 11,
              style: TextStyle(fontSize: 20.sp),
            ),
          ),
          20.verticalSpace,
          20.verticalSpace,
          HavenButton(buttonText: "Login", color: kPrimaryColor500),
        ],
      ),
    );
  }
}
