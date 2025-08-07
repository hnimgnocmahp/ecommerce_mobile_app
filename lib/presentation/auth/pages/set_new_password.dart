import 'package:ecommerce_mobile_app/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce_mobile_app/core/configs/assets/app_images.dart';
import 'package:ecommerce_mobile_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_mobile_app/presentation/auth/page/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetNewPassword extends StatelessWidget{
  const SetNewPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.letterLogo),
              SizedBox(height: 20),
              Text(
                'We Sent you an Email to reset your password.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              BasicAppButton(
                onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => SignInPage())
                  );
                },
                title: 'Back to Sign In',
                color: AppColor.primary,
                width: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}