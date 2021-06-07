import 'package:flutter/material.dart';

class Validator {
  static String validateField({@required String value}) {
    if (value.isEmpty) {
      return 'Field can\'t be empty';
    }

    return null;
  }

  static String validateUserID({@required String uid}) {
    if (uid.isEmpty) {
      return 'User ID can\'t be empty';
    } else if (uid.length <= 3) {
      return 'User ID should be greater than 3 characters';
    }

    return null;
  }

  static String validateFieldNumber({@required String value, @required String typeField}) {
    if (value.isEmpty) {
      return 'Field can\'t be empty';
    }
    bool hasError = false;
    switch (typeField){
      case "double":
        hasError = double.tryParse(value) == null ? true : false;
      break;
      case "int":
        hasError = int.tryParse(value) == null ? true : false;
      break;
    }

    if(hasError)
      return 'Value ' + value + " is not a type of " + typeField;

    return null;
  }
}