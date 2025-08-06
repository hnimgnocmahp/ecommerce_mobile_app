import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_mobile_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_mobile_app/presentation/auth/page/signup.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/input/custom_text_field.dart';
import '../../../core/configs/assets/app_images.dart';
import 'continue_signin.dart';

class SignInPage extends StatelessWidget{
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 50),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff272727),
                      ),
                    )
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextField(
                    hintText: 'Email Address',
                  ),
                ),
                SizedBox(height: 20,),
                BasicAppButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => ContinueSignInPage())
                    );
                  },
                  title: 'Continue',
                  color: AppColor.primary,
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Don\'t have an account?', style: TextStyle(fontSize: 12),),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SignUpPage())
                        );
                      },
                      child: Text(' Create One', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)),
                  ],
                ),
                SizedBox(height: 50,),
                BasicAppButton(
                  onPressed: (){},
                  icon: AppImages.appleIcon,
                  title: 'Continue with Apple',
                ),
                SizedBox(height: 20,),
                BasicAppButton(
                  onPressed: (){},
                  icon: AppImages.googleIcon,
                  title: 'Continue with Google',
                ),
                SizedBox(height: 20,),
                BasicAppButton(
                  onPressed: (){},
                  icon: AppImages.facebookIcon,
                  title: 'Continue with Facebook',
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}