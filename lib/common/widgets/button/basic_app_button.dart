import 'package:ecommerce_mobile_app/core/configs/assets/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_color.dart';


class BasicAppButton extends StatelessWidget{
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  final double ? width;
  final Color ? color;
  final String ? icon;
  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.color,
    this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width ?? double.infinity, height ?? 50),
          backgroundColor: color,
        ),
        child: Stack(
          alignment: Alignment.center,
          children:
            [
              if (icon != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    icon!,
                    width: 24,
                    height: 24,
                  ),
                ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color == AppColor.primary ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ]

        ),
    );
  }
}