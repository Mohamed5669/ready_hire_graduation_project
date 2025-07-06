import 'package:flutter/cupertino.dart';
import 'package:ready_hire/features/auth/presentation/authentication/forget_password/forget.dart';
import 'package:ready_hire/features/home/presentation/home2.dart';

import '../../features/auth/presentation/authentication/privacy/privacy.dart';
import '../../features/auth/presentation/authentication/select_job_type/select_job_type.dart';
import '../../features/auth/presentation/authentication/sign/sign.dart';
import '../../features/auth/presentation/authentication/signIn/sign_in.dart';
import '../../features/auth/presentation/authentication/signUp/sign_up.dart';
import '../../features/auth/presentation/authentication/sign_up_as_company/sign_up_as_company.dart';
import '../../features/auth/presentation/authentication/sign_up_as_employee/sign_up_as_employee.dart';
import '../../features/home/presentation/home.dart';
import '../../features/onboarding/presentation/onboarding/onboarding.dart';
import '../../features/splash/splash_screen.dart';


class RoutesManager {
  static const String splash = "/splash";
  static const String onBoarding = "/onBoarding";
  static const String sign = "/sign";
  static const String signUp = "/signUp";
  static const String signIn = "/signIn";
  static const String selectJob = "/selectJob";
  static const String privacy = "/privacy";
  static const String forgetPassword = "/forgetPassword";
  static const String signUpAsEmployee = "/signUpAsEmployee";
  static const String signUpAsCompany = "/signUpAsCompany";
  static const String home = "/home";
  static const String home2 = "/home2";


  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => SplashScreen());
      case onBoarding:
        return CupertinoPageRoute(builder: (context) => Onboarding());
      case sign:
        return CupertinoPageRoute(builder: (context) => Sign());
      case signUp:
        return CupertinoPageRoute(builder: (context) => const SignUp());
      case signUpAsEmployee:
        return CupertinoPageRoute(builder: (context) => SignUpAsEmployee());
      case signUpAsCompany:
        return CupertinoPageRoute(builder: (context) => SignUpAsCompany());
      case selectJob:
        return CupertinoPageRoute(
            builder: (context) => const SelectJobTypePage());
      case privacy:
        return CupertinoPageRoute(
            builder: (context) => const PrivacyPoliciesPage());
      case signIn:
        return CupertinoPageRoute(builder: (context) => const SignIn());
      case forgetPassword:
        return CupertinoPageRoute(
          builder: (context) => ForgetPassword(),
        );
      case home:
        return CupertinoPageRoute(
          builder: (context) => const Home(),
        );
      case home2:
        return CupertinoPageRoute(
          builder: (context) => const Home2(),
        );
    }
  }
}
