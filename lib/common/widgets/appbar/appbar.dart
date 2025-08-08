import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget ? title;
  final Widget ? action;
  final bool hideBack;
  const BasicAppBar({super.key, this.title, this.action, this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const SizedBox.shrink(),
      centerTitle: true,
      actions: [
        action ?? const SizedBox.shrink(),
      ],
      automaticallyImplyLeading: false,
      leading: hideBack ? null : IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          )
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}