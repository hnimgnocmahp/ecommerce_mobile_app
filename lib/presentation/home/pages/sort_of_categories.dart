import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_mobile_app/core/configs/assets/app_images.dart';
import 'package:ecommerce_mobile_app/presentation/home/widgets/category_item.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget{
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shop By Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            CategoryItem(title: 'Hoodies', image: AppImages.hoody),
            CategoryItem(title: 'Accessories', image: AppImages.hoody),
            CategoryItem(title: 'Shorts', image: AppImages.hoody),
            CategoryItem(title: 'Shoes', image: AppImages.hoody),
            CategoryItem(title: 'Bags', image: AppImages.hoody),
          ]
        )
      )
    );
  }

}