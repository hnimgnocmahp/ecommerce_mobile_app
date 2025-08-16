import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_mobile_app/core/configs/theme/app_color.dart';
import 'package:ecommerce_mobile_app/domain/usecases/auth/sign_in.dart';
import 'package:ecommerce_mobile_app/presentation/auth/pages/reset_password.dart';
import 'package:ecommerce_mobile_app/presentation/intro/pages/start.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/input/custom_text_field.dart';
import '../../../data/models/auth/signin_user_reg.dart';
import '../../../service_locator.dart';

class ContinueSignInPage extends StatelessWidget{
  final TextEditingController _password= TextEditingController();
  final String email;
  ContinueSignInPage({super.key, required this.email});
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
                isPassword: true,
                controller: _password,
              ),
            ),
            SizedBox(height: 20,),
            BasicAppButton(
              onPressed: () async{
                if (_password.text.isEmpty) {
                  var snackBar = SnackBar(
                    content: Text(
                      'Password is required',
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
                var result = await sl<SignInUseCase>().call(
                  params: SigningUserReg(
                    email: email,
                    password: _password.text.trim(),
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
                    return;
                  },

                  (r){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => StartedPage()),
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