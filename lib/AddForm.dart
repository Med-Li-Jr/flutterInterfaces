import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/CustomColor.dart';
import 'package:flutter_interfaces/CustomField.dart';
import 'package:flutter_interfaces/DatabaseFB.dart';
import 'package:flutter_interfaces/GuestBook.dart';
import 'package:flutter_interfaces/Validator.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode descriptionFocusNode;
  final FocusNode dataDoubleFocusNode;
  final FocusNode dataIntFocusNode;
  final FocusNode dataBoolFocusNode;

  const AddItemForm({
    @required this.nameFocusNode,
    @required this.descriptionFocusNode,
    @required this.dataDoubleFocusNode,
    @required this.dataIntFocusNode,
    @required this.dataBoolFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dataDoubleController = TextEditingController();
  final TextEditingController _dataIntController = TextEditingController();
  final TextEditingController _dataBoolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
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
                Text(
                  'Name',
                  style: TextStyle(
                    color: CustomColors.itemListColor,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
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
                SizedBox(height: 24.0),
                Text(
                  'Description',
                  style: TextStyle(
                    color: CustomColors.itemListColor,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 1,
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
                SizedBox(height: 24.0),
                Text(
                  'dataDouble',
                  style: TextStyle(
                    color: CustomColors.itemListColor,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 1,
                  isLabelEnabled: false,
                  controller: _dataDoubleController,
                  focusNode: widget.dataDoubleFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Data Double',
                  hint: 'Enter your note data double',
                ),
                SizedBox(height: 24.0),
                Text(
                  'dataInt',
                  style: TextStyle(
                    color: CustomColors.itemListColor,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 1,
                  isLabelEnabled: false,
                  controller: _dataIntController,
                  focusNode: widget.dataIntFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Data Int',
                  hint: 'Enter your note data int',
                ),
                SizedBox(height: 24.0),
                Text(
                  'dataBool',
                  style: TextStyle(
                    color: CustomColors.itemListColor,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 1,
                  isLabelEnabled: false,
                  controller: _dataBoolController,
                  focusNode: widget.dataBoolFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Data Bool',
                  hint: 'Enter your note data bool',
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
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        CustomColors.secondColor,
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
                      widget.dataDoubleFocusNode.unfocus();
                      widget.dataIntFocusNode.unfocus();
                      widget.dataBoolFocusNode.unfocus();

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
                          Guestbook(
                            userId: "sdf6s51se65",
                            timestamp: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            name: _nameController.text,
                            description: _descriptionController.text,
                            dataDouble: double.parse(_dataBoolController.text),
                            dataInt: int.parse(_dataIntController.text),
                            dataBool: _dataBoolController.text == "true",
                          ),
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'ADD ITEM',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.itemListColor,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
