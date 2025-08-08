
import 'package:ecommerce_mobile_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget{
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Satoshi'
          ),
        ),
        hideBack: true,
      ),
    );
  }

}