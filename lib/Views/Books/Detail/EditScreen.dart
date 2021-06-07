import 'package:flutter/material.dart';
import 'package:flutter_interfaces/Controller/BooksController.dart';
import 'package:flutter_interfaces/Views/Shared/AppBarTitle.dart';
import 'package:flutter_interfaces/Utilities/CustomColor.dart';
import 'package:flutter_interfaces/Views/Books/Detail/EditForm.dart';
import 'package:flutter_interfaces/Modal/Enitities/GuestBook.dart';
import 'package:flutter_interfaces/Views/Shared/PathCurrentUI.dart';

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

  bool _isDeleting = false;

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: CustomColors.secondColor,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        
        setState(() {
          _isDeleting = false;
        });
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Delete",
        style: TextStyle(
          color: CustomColors.mColorBtnCancel,
          fontSize: 21,
        ),
      ),
      onPressed: () async {
        _nameFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
        _dataDoubleFocusNode.unfocus();
        _dataIntFocusNode.unfocus();
        _dataBoolFocusNode.unfocus();
        setState(() {
          _isDeleting = true;
        });

        String resp = await BooksController.supprimerDonnees(
            widget.currentGuestBook.bookId);

        if (resp != null) {
          // ScaffoldMessenger.
        setState(() {
          _isDeleting = false;
        });
          ScaffoldMessenger(
            child: SnackBar(
              content: Text(resp),
            ),
          );
        } else {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Are you sure to delete this Book?"),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: CustomColors.primaryColor,
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(
                        color: CustomColors.secondColor,
                        width: 2
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: CustomColors.mColorBtnCancel,
                        size: 35,
                      ),
                      onPressed: () async {
                        setState(() {
                          _isDeleting = true;
                        });

                        showAlertDialog(context);
                      },
                    ),
                  ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 7,
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                children: [
                  PathCurrentUI(
                    fullPath: "Home",
                    currentPath: "Detail Book",
                  ),
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
