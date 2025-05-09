import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:haven/haven/components/image.dart';
import 'package:haven/haven/components/scaffold.dart';
import 'package:haven/haven/core/helpers/extensions.dart';
import 'package:haven/haven/core/services/navigation_service/nav_config.dart';
import 'package:haven/haven/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../generated/assets.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../components/texts/texts.dart';
import '../../../../core/theme/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneController = TextEditingController();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return HavenScaffold(
      padding: 20,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HavenImage(imagePath: Assets.pngsLogo, width: 160, height: 36),
          100.verticalSpace,
          Flexible(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                LoginStepOne(
                  phoneController: _phoneController,
                  pageController: pageController,
                ),
                LoginStepTwo(
                  verificationID: "",
                  pageController: pageController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginStepOne extends StatefulWidget {
  final TextEditingController phoneController;
  final PageController pageController;

  const LoginStepOne({
    super.key,
    required this.phoneController,
    required this.pageController,
  });

  @override
  State<LoginStepOne> createState() => _LoginStepOneState();
}

class _LoginStepOneState extends State<LoginStepOne> {
  String buttonText = "Login";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          // Handle successful login
          setState(() {
            buttonText = "Loading...";
          });
        } else if (state is AuthErrorState) {
          // Handle login failure
        } else if (state is AuthSuccessState) {
          // Handle successful login
          setState(() {
            buttonText = "Success...";
          });
          widget.pageController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        }
      },
      child: Center(
        child: SizedBox(
          width: 1.sw, // Fixed width
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      controller: widget.phoneController,
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
                      onEditingComplete: () {
                        widget.phoneController.text.formatNigerianPhoneNumber();
                      },
                      maxLength: 11,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                  20.verticalSpace,
                  20.verticalSpace,
                  HavenButton(
                    buttonText: buttonText,
                    color: kPrimaryColor500,
                    onPressed: () {
                      if (widget.phoneController.text.isNotEmpty) {
                        // Trigger the login event
                        context.read<AuthBloc>().add(
                          AuthRequestedEvent(widget.phoneController.text),
                        );
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid phone number")),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginStepTwo extends StatefulWidget {
  final String verificationID;
  final PageController pageController;

  const LoginStepTwo({
    super.key,
    required this.verificationID,
    required this.pageController,
  });

  @override
  State<LoginStepTwo> createState() => _LoginStepTwoState();
}

class _LoginStepTwoState extends State<LoginStepTwo> {
  final TextEditingController verificationCode = TextEditingController();
  String buttonText = "Verify";
  Color buttonColor = kPrimaryColor500;

  @override
  Widget build(BuildContext context) {
    final nav = GetIt.instance<NavigationService>();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          // Handle successful login
          setState(() {
            buttonText = "Loading...";
          });
        } else if (state is AuthErrorState) {
          // Handle login failure
        } else if (state is AuthConfirmSuccessState) {
          // Handle successful login
          setState(() {
            buttonText = "Success...";
            buttonColor = Colors.lightGreen;
          });
          nav.navigateAndReplace("/dashboard");
        }
      },
      child: Center(
        child: SizedBox(
          width: 1.sw, // Fixed width
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HavenText(
                    text: "Login to your Haven Account",
                    fontSize: 24,
                    color: kPrimaryColor500,
                  ),
                  50.verticalSpace,
                  HavenText(
                    text: "Enter your verification code",
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
                      controller: verificationCode,
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
                      maxLength: 4,
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                  20.verticalSpace,
                  20.verticalSpace,
                  HavenButton(
                    buttonText: buttonText,
                    color: buttonColor,
                    onPressed: () {
                      if (verificationCode.text.isNotEmpty) {
                        // Trigger the login event
                        context.read<AuthBloc>().add(
                          AuthConfirmEvent(
                            widget.verificationID,
                            verificationCode.text,
                          ),
                        );
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter verification code")),
                        );
                      }
                    },
                  ),
                  20.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      widget.pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Row(children: [Icon(Ionicons.arrow_back)]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
