import 'package:flutter/material.dart';
import 'package:flutter_interfaces/AddScreen.dart';
import 'package:flutter_interfaces/AppBarTitle.dart';
import 'package:flutter_interfaces/CustomColor.dart';
import 'package:flutter_interfaces/ItemList.dart';

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
            top: 15,
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      'Home > ',
                      style: TextStyle(
                        // color: CustomColors.primaryColor,
                        color: CustomColors.thirdColor,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Books',
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
              Expanded(child: ItemList()),
            ],
          ),
        ),
      ),
    );
  }
}
