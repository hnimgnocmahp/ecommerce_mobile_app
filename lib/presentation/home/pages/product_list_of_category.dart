import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/product_container/product_container.dart';
import '../../../core/configs/assets/app_images.dart';
final products = [
  {
    'name': "Men's Harrington Jacket",
    'price': "\$148.00",
  },
  {
    'name': "Max Cirro Men's Slides",
    'price': "\$55.00",
  },
  {
    'name': "Max Cirro Men's Slides",
    'price': "\$55.00",
  },
  {
    'name': "Max Cirro Men's Slides",
    'price': "\$55.00",
  },
  {
    'name': "Max Cirro Men's Slides",
    'price': "\$55.00",
  },
  {
    'name': "Max Cirro Men's Slides",
    'price': "\$55.00",
  },
  {
    'name': "Max Cirro Men's Slides",
    'price': "\$55.00",
  },
];
class Category extends StatelessWidget {
  const Category({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.7,
        children: List.generate(products.length, (index) {
          final product = products[index];
          return ProductContainer(
              imageProduct: AppImages.product,
              nameProduct: product['name'].toString(),
              priceProduct: product['price'].toString(),

          );
        }),
      ),



    );
  }
}