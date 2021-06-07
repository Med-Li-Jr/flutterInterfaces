import 'package:flutter/material.dart';
import 'package:flutter_interfaces/Utilities/CustomColor.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'FlutterFire CRUD',
              style: TextStyle(
                color: CustomColors.thirdColor,
                fontSize: 28,
              ),
            ),
          ],
        ),
     ],
    );
  }
}
