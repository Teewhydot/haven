import 'package:get/get.dart';
import 'package:haven/haven/features/dashboard/presentation/pages/dashboard.dart';
import 'package:haven/haven/features/dashboard/presentation/pages/matched.dart';
import 'package:haven/haven/features/introduction/presentation/pages/intro_screen.dart';

import '../../features/auth/presentation/pages/login.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(name: '/dashboard', page: () => Dashboard()),
    GetPage(name: '/matched', page: () => Matched()),
    GetPage(name: '/', page: () => IntroScreen()),
    GetPage(name: '/login', page: () => Login()),
    // // Dynamic route example
    // GetPage(
    //   name: '/user/:id',
    //   page: () => UserDetailScreen(),
    // ),
  ];
}
