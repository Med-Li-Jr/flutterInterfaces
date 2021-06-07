import 'package:flutter/material.dart';
import 'package:flutter_interfaces/AppBarTitle.dart';
import 'package:flutter_interfaces/CustomColor.dart';
import 'package:flutter_interfaces/DatabaseFB.dart';
import 'package:flutter_interfaces/EditForm.dart';
import 'package:flutter_interfaces/GuestBook.dart';

class EditScreen extends StatefulWidget {
  final Guestbook currentGuestBook;

  EditScreen({
    @required this.currentGuestBook,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                children: [
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
                          'Detail Book',
                          style: TextStyle(
                            // color: CustomColors.primaryColor,
                            color: CustomColors.secondColor,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  EditItemForm(
                    nameFocusNode: _nameFocusNode,
                    descriptionFocusNode: _descriptionFocusNode,
                    dataDoubleFocusNode: _dataDoubleFocusNode,
                    dataIntFocusNode: _dataIntFocusNode,
                    dataBoolFocusNode: _dataBoolFocusNode,
                    currentGuestbook: widget.currentGuestBook,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
