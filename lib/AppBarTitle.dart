
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/CustomColor.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'images/owl-2.jpg',
          height: 30,
        ),
        SizedBox(width: 8),
        Text(
          'FlutterFire CRUD',
          style: TextStyle(
            // color: CustomColors.primaryColor,
            color: CustomColors.thirdColor,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}