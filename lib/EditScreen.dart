
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

  bool _isDeleting = false;

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
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[900],
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        guestbookId: widget.currentGuestBook.bookId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              nameFocusNode: _nameFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
              dataDoubleFocusNode: _dataDoubleFocusNode,
              dataIntFocusNode: _dataIntFocusNode,
              dataBoolFocusNode: _dataBoolFocusNode,
              currentGuestbook: widget.currentGuestBook,
            ),
          ),
        ),
      ),
    );
  }
}