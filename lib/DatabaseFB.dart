  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/GuestBook.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('guestbook');


class Database {
  static String userUid;

  static Future<void> addItem(Guestbook guestbook) async {
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = guestbook.toMap();

    await _mainCollection
        .add(data)
        .whenComplete(() => print("GuestBook item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem(Guestbook guestbook) async {
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = guestbook.toMap();

    await _mainCollection
        .doc(guestbook.bookId)
        .update(data)
        .whenComplete(() => print("GuestBook item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    // CollectionReference GuestBooksItemCollection =
    //     _mainCollection.doc(userUid).collection('items');

    return _mainCollection.snapshots();
  }

  static Future<void> deleteItem({
    @required String guestbookId,
  }) async {
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(userUid).collection('items').doc(docId);

    await _mainCollection
        .doc(guestbookId)
        .delete()
        .whenComplete(() => print('GuestBook item deleted from the database'))
        .catchError((e) => print(e));
  }
}