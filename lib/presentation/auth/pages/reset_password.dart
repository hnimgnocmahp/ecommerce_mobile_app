import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_mobile_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_mobile_app/presentation/auth/pages/set_new_password.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/input/custom_text_field.dart';

class ForgotPassword extends StatelessWidget{
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
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
                      'Forgot Password',
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
                        MaterialPageRoute(builder: (BuildContext context) => SetNewPassword())
                    );
                  },
                  title: 'Continue',
                  color: AppColor.primary,
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}