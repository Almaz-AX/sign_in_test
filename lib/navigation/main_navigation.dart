import 'package:flutter/material.dart';
import 'package:sign_in_test/features/main_screen/presentation/pages/main_page.dart';
import 'package:sign_in_test/features/sign_up/presentation/pages/phone_input_page.dart';
import 'package:sign_in_test/features/sign_up/presentation/pages/sms_code_input_page.dart';

abstract class MainNavigationRouteNames {
  static const phoneInput = '/phone_input';
  static const smsCodeInput = '/sms_code_input';
  static const myProfile = '/my_profile';
  static const nameEditing = '/name_editing';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.phoneInput: (context) => const PhoneInputPage(),
    MainNavigationRouteNames.smsCodeInput: (context) =>
        const SmsCodeInputPage(),
    MainNavigationRouteNames.myProfile: (context) => const MainPage(),
  };
}
