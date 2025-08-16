import 'package:ecommerce_mobile_app/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce_mobile_app/common/widgets/dropdown/age_dropdown.dart';
import 'package:ecommerce_mobile_app/presentation/wrapper/pages/main_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/configs/theme/app_color.dart';

class StartedPage extends StatelessWidget{
  const StartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                'Tell us About yourself',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Satoshi'
                ),
              ),
              SizedBox(height: 50,),
              Text(
                'Who do you shop for ?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Satoshi'
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BasicAppButton(
                    onPressed: (){},
                    title: 'Men',
                    color: AppColor.primary,
                    width: MediaQuery.of(context).size.width/2 - 30
                  ),
                  BasicAppButton(
                    onPressed: (){},
                    title: 'Women',
                    width: MediaQuery.of(context).size.width/2 - 30,
                    color: Color(0xffF4F4F4),
                  ),
                ]
              ),
              SizedBox(height: 50,),
              Text(
                'How Old are you ?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Satoshi'
                ),
              ),
              SizedBox(height: 20,),
              // Đây là nơi khai báo dropdown
              AgeDropdown(),
              Spacer(),
              BasicAppButton(
                onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
                  );
                },
                title: 'Finish',
                color: AppColor.primary,
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}