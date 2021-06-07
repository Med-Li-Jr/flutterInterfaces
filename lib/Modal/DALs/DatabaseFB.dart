import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/Modal/Enitities/GuestBook.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('guestbook');

class Database {
  static String userUid;

  static Future<String> addItem(Guestbook guestbook) async {
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = guestbook.toMap();

    bool hasError = false;

    await _mainCollection
        .add(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {
              print(e),
              hasError = true,
            });
    await _mainCollection
        .add(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {
              print(e),
              hasError = true,
            });
    await _mainCollection
        .add(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {
              print(e),
              hasError = true,
            });
    await _mainCollection
        .add(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {
              print(e),
              hasError = true,
            });
    await _mainCollection
        .add(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {
              print(e),
              hasError = true,
            });
    await _mainCollection
        .add(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {
              print(e),
              hasError = true,
            });
    await _mainCollection
        .add(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {
              print(e),
              hasError = true,
            });
    await _mainCollection
        .add(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {
              print(e),
              hasError = true,
            });

    if (hasError) return "Il y a eu une erreur lors de l'ajout";

    return null;
  }

  static Stream<QuerySnapshot> readItems() {
    // CollectionReference GuestBooksItemCollection =
    //     _mainCollection.doc(userUid).collection('items');

    return _mainCollection.snapshots();
  }

  static Future<String> updateItem(Guestbook guestbook) async {
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = guestbook.toMap();

    bool hasError = false;

    await _mainCollection
        .doc(guestbook.bookId)
        .update(data)
        .whenComplete(() => hasError = false)
        .catchError((e) => {print(e), hasError = true});

    if (hasError) return "Il y a eu une erreur lors de la modification";

    return null;
  }

  static Future<String> deleteItem({
    @required String guestbookId,
  }) async {
    // DocumentReference documentReferencer =
    //     _mainCollection.doc(userUid).collection('items').doc(docId);

    bool hasError = false;
    await _mainCollection
        .doc(guestbookId)
        .delete()
        .whenComplete(() => hasError = false)
        .catchError((e) => {print(e), hasError = true});

    if (hasError) return "Il y a eu une erreur lors de la modification";

    return null;
  }
}
