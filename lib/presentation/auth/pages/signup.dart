import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_mobile_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_mobile_app/presentation/auth/pages/reset_password.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/input/custom_text_field.dart';

class SignUpPage extends StatelessWidget{
  SignUpPage({super.key, });
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: BasicAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
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
                    hintText: 'First Name',
                    keyboardType: TextInputType.name,
                    focusNode: firstNameFocus,
                    onFieldSubmitted: (value) {
                      firstNameFocus.unfocus();
                      FocusScope.of(context).requestFocus(lastNameFocus);
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextField(
                    hintText: 'Last Name',
                    keyboardType: TextInputType.name,
                    focusNode: lastNameFocus,
                    onFieldSubmitted: (value) {
                      lastNameFocus.unfocus();
                      FocusScope.of(context).requestFocus(emailFocus);
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextField(
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocus,
                    onFieldSubmitted: (value) {
                      emailFocus.unfocus();
                      FocusScope.of(context).requestFocus(passwordFocus);
                      },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextField(
                    hintText: 'Password',
                    isPassword: true,
                    focusNode: passwordFocus,
                    onFieldSubmitted: (value) {
                      passwordFocus.unfocus();
                      FocusScope.of(context).requestFocus(confirmPasswordFocus);
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextField(
                    hintText: 'Confirm Password',
                    isPassword: true,
                    focusNode: confirmPasswordFocus,
                    textInputAction: TextInputAction.done
                  ),
                ),
                SizedBox(height: 20,),
                BasicAppButton(
                  onPressed: (){},
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
        ),
      ),

    );
  }
}