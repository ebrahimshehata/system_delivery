import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../general/user_type.dart';
class ProfileUser extends StatelessWidget {
   ProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }

}

class _buildItem extends StatelessWidget {
  final String title;
  final String? leftIconImage;
  final String? rightIconImage;
  Color? iconColor = Color(0xFF95989A);
  Color? fontColor = Color(0xFF447A78);
  Function()? onTap;

  _buildItem({
    this.leftIconImage,
    required this.title,
    this.rightIconImage,
    this.iconColor,
    this.onTap,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        rightIconImage == null
            ? SizedBox(width: 30)
            : InkWell(
            onTap: onTap,
            child: Image.asset(rightIconImage!)
        ),
        SizedBox(width: 20),
        Expanded(
          child: Text(
            this.title,
            style: TextStyle(
              color: fontColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 20),
        leftIconImage == null
            ? SizedBox(width: 20)
            : InkWell(
            onTap: onTap,
            child:Image.asset(
                leftIconImage!
            )
        ),
      ],
    );
  }
}
