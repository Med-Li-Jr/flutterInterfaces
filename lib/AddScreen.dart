import 'package:flutter/material.dart';
import 'package:flutter_interfaces/AddForm.dart';
import 'package:flutter_interfaces/AppBarTitle.dart';
import 'package:flutter_interfaces/CustomColor.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _dataDoubleFocusNode = FocusNode();
  final FocusNode _dataIntFocusNode = FocusNode();
  final FocusNode _dataBoolFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
        _dataDoubleFocusNode.unfocus();
        _dataIntFocusNode.unfocus();
        _dataBoolFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.secondColor,
          title: AppBarTitle(),
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
                        'Add Book',
                        style: TextStyle(
                          // color: CustomColors.primaryColor,
                          color: CustomColors.secondColor,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                AddItemForm(
                  nameFocusNode: _nameFocusNode,
                  descriptionFocusNode: _descriptionFocusNode,
                  dataDoubleFocusNode: _dataDoubleFocusNode,
                  dataIntFocusNode: _dataIntFocusNode,
                  dataBoolFocusNode: _dataBoolFocusNode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
