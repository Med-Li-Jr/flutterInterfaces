
import 'package:flutter/material.dart';

class DetailUpdateVew extends StatefulWidget {
  
  DetailUpdateVew({Key key,  @required this.message}) : super(key: key);
  
  final String message;

  @override
  _DetailUpdateVewState createState() => _DetailUpdateVewState();
}

class _DetailUpdateVewState extends State<DetailUpdateVew> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: widget.message
              ),
              
            ),
            
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}


