import 'package:flutter/material.dart';
import 'package:flutter_interfaces/Utilities/CustomColor.dart';

class PathCurrentUI extends StatelessWidget {
  final String fullPath;
  final String currentPath;

  const PathCurrentUI(
      {Key key, @required this.fullPath, @required this.currentPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          SizedBox(
            child: Row(
              children: [ 
                Text(
                  this.fullPath + ' > ',
                  style: TextStyle(
                    // color: CustomColors.primaryColor,
                    // color: CustomColors.thirdColor,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                Text(
                  this.currentPath,
                  style: TextStyle(
                    // color: CustomColors.primaryColor,
                    color: CustomColors.secondColor,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
