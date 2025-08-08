import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_mobile_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_mobile_app/presentation/auth/pages/reset_password.dart';
import 'package:ecommerce_mobile_app/presentation/intro/pages/start.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/input/custom_text_field.dart';

class ContinueSignInPage extends StatelessWidget{
  const ContinueSignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
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
                hintText: 'Password',
                isPassword: true
              ),
            ),
            SizedBox(height: 20,),
            BasicAppButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => StartedPage())
                );
              },
              title: 'Continue',
              color: AppColor.primary,
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Forgot Password?', style: TextStyle(fontSize: 12),),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ForgotPassword())
                      );
                    },
                    child: Text(' Reset', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)),
              ],
            ),

          ],
        ),
      ),

    );
  }
}