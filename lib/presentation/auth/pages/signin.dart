import 'package:ecommerce_mobile_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_mobile_app/domain/usecases/auth/check_email.dart';
import 'package:ecommerce_mobile_app/presentation/auth/pages/signup.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/input/custom_text_field.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../data/models/auth/check_email.dart';
import '../../../data/models/auth/signin_user_reg.dart';
import '../../../domain/usecases/auth/sign_in.dart';
import '../../../service_locator.dart';
import 'continue_signin.dart';

class SignInPage extends StatelessWidget{
  final TextEditingController _email= TextEditingController();
  SignInPage({super.key});
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
                    controller: _email,
                  ),
                ),
                SizedBox(height: 20,),
                BasicAppButton(
                  onPressed: () async{
                    if (_email.text.isEmpty) {
                      var snackBar = SnackBar(
                        content: Text(
                          'Email is required',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        padding: EdgeInsets.all(16),
                        elevation: 10,
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(_email.text)) {
                      var snackBar = SnackBar(
                        content: Text(
                          'Invalid email format',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        padding: EdgeInsets.all(16),
                        elevation: 10,
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    var result = await sl<CheckEmailUseCase>().call(
                        params: CheckEmailRequest(
                          email: _email.text.trim(),
                        )
                    );
                    result.fold(
                      (l){
                          var snackBar = SnackBar(
                            content: Text(
                              l,
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            padding: EdgeInsets.all(16),
                            elevation: 10,
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      (r){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => ContinueSignInPage(email: _email.text,)),
                                (route) => false
                        );
                      }
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