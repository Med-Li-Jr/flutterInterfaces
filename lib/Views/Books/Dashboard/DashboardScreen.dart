import 'package:flutter/material.dart';
import 'package:flutter_interfaces/Views/Books/Add/AddScreen.dart';
import 'package:flutter_interfaces/Views/Shared/AppBarTitle.dart';
import 'package:flutter_interfaces/Utilities/CustomColor.dart';
import 'package:flutter_interfaces/Views/Books/Dashboard/ItemList.dart';
import 'package:flutter_interfaces/Views/Shared/PathCurrentUI.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.secondColor,
        title: AppBarTitle(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: CustomColors.secondColor,
        child: Icon(
          Icons.add,
          color: CustomColors.thirdColor,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PathCurrentUI(
                fullPath: "Home",
                currentPath: "Books",
              ),
              Expanded(child: ItemList()),
            ],
          ),
        ),
      ),
    );
  }
}
