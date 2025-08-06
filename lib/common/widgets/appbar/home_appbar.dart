import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColor.primary,
            shape: BoxShape.circle,
          )
        ),
        centerTitle: true,
        title: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(30),
          ),

        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColor.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.white,)),
        ],

      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

