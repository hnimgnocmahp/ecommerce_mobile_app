import 'package:ecommerce_mobile_app/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';
import '../../auth/page/signin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Image.asset(AppImages.introBg)

      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }

}