import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/CustomColor.dart';
import 'package:flutter_interfaces/CustomField.dart';
import 'package:flutter_interfaces/DatabaseFB.dart';
import 'package:flutter_interfaces/GuestBook.dart';
import 'package:flutter_interfaces/Validator.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode descriptionFocusNode;
  final FocusNode dataDoubleFocusNode;
  final FocusNode dataIntFocusNode;
  final FocusNode dataBoolFocusNode;
  final Guestbook currentGuestbook;

  const EditItemForm(
      {@required this.nameFocusNode,
      @required this.descriptionFocusNode,
      @required this.dataDoubleFocusNode,
      @required this.dataIntFocusNode,
      @required this.dataBoolFocusNode,
      @required this.currentGuestbook});

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _nameController;
  TextEditingController _descriptionController;
  TextEditingController _dataDoubleController;
  TextEditingController _dataIntController;
  bool _radioDataBool = true;

  @override
  void initState() {
    _nameController = TextEditingController(
      text: widget.currentGuestbook.name,
    );

    _descriptionController = TextEditingController(
      text: widget.currentGuestbook.description,
    );
    _dataDoubleController = TextEditingController(
      text: widget.currentGuestbook.dataDouble.toString(),
    );

    _dataIntController = TextEditingController(
      text: widget.currentGuestbook.dataInt.toString(),
    );

    _radioDataBool = widget.currentGuestbook.dataBool;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18.0),
                  Text(
                    'Name',
                    style: TextStyle(
                      color: CustomColors.itemListColor,
                      fontSize: 18.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _nameController,
                    focusNode: widget.nameFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Name',
                    hint: 'Enter your note name',
                  ),
                  SizedBox(height: 18.0),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: CustomColors.itemListColor,
                      fontSize: 18.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _descriptionController,
                    focusNode: widget.descriptionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Description',
                    hint: 'Enter your note description',
                  ),
                  SizedBox(height: 18.0),
                  Text(
                    'DataDouble',
                    style: TextStyle(
                      color: CustomColors.itemListColor,
                      fontSize: 18.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7.0),

                  CustomFormField(
                    maxLines: 1,
                    isLabelEnabled: false,
                    controller: _dataDoubleController,
                    focusNode: widget.dataDoubleFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateFieldNumber(
                        value: value, typeField: "double"),
                    label: 'Data Double',
                    hint: 'Enter your note data double',
                  ),

                  SizedBox(height: 18.0),
                  Text(
                    'DataInt',
                    style: TextStyle(
                      color: CustomColors.itemListColor,
                      fontSize: 18.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  CustomFormField(
                    maxLines: 1,
                    isLabelEnabled: false,
                    controller: _dataIntController,
                    focusNode: widget.dataIntFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => Validator.validateFieldNumber(
                        value: value, typeField: "int"),
                    label: 'Data Int',
                    hint: 'Enter your note data int',
                  ),
                  SizedBox(height: 18.0),

                  Text(
                    'DataBool',
                    style: TextStyle(
                      color: CustomColors.itemListColor,
                      fontSize: 18.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  // CustomFormField(
                  //   maxLines: 1,
                  //   isLabelEnabled: false,
                  //   controller: _dataBoolController,
                  //   focusNode: widget.dataBoolFocusNode,
                  //   keyboardType: TextInputType.text,
                  //   inputAction: TextInputAction.done,
                  //   validator: (value) => Validator.validateField(
                  //     value: value,
                  //   ),
                  //   label: 'Data Bool',
                  //   hint: 'Enter your note data bool',
                  // ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                        value: true,
                        groupValue: _radioDataBool,
                        onChanged: (value) {
                          setState(() {
                            _radioDataBool = value;
                          });
                        },
                      ),
                      new Text(
                        'True',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: false,
                        groupValue: _radioDataBool,
                        onChanged: (value) {
                          setState(() {
                            _radioDataBool = value;
                          });
                        },
                      ),
                      new Text(
                        'False',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _isProcessing
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        CustomColors.secondColor,
                      ),
                    ),
                  )
                : Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        bottom: 24.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  CustomColors.mColorBtnSucces,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                widget.nameFocusNode.unfocus();
                                widget.descriptionFocusNode.unfocus();

                                if (_editItemFormKey.currentState.validate()) {
                                  setState(() {
                                    _isProcessing = true;
                                  });

                                  widget.currentGuestbook.name =
                                      _nameController.text;
                                  widget.currentGuestbook.description =
                                      _descriptionController.text;
                                  widget.currentGuestbook.dataDouble =
                                      double.parse(_dataDoubleController.text);
                                  widget.currentGuestbook.dataInt =
                                      int.parse(_dataIntController.text);
                                  widget.currentGuestbook.dataBool =
                                      _radioDataBool;
                                  widget.currentGuestbook.timestamp =
                                      DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();
                                  await Database.updateItem(
                                      widget.currentGuestbook);

                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  Navigator.of(context).pop();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(11.0),
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.itemListColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  CustomColors.mColorBtnCancel,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                widget.nameFocusNode.unfocus();
                                widget.descriptionFocusNode.unfocus();
                                setState(() {
                                  _isProcessing = true;
                                });

                                await Database.deleteItem(
                                  guestbookId: widget.currentGuestbook.bookId,
                                );

                                setState(() {
                                  _isProcessing = false;
                                });

                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(11.0),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.itemListColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
