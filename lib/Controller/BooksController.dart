import 'package:flutter_interfaces/Modal/DALs/DatabaseFB.dart';
import 'package:flutter_interfaces/Modal/Enitities/GuestBook.dart';

class BooksController {

  static obtenirLesDonnees() {
    return Database.readItems();
  }

  static obtenirLesDonneesByIdUser(String idUser) {
    return Database.readItemsByIdUser(idUser);
  }
  static Future<String> ajouterBook(
    String userId,
    String timestamp,
    String name,
    String description,
    String dataDouble,
    String dataInt,
    bool dataBool,
  ) async {
    try {
      String resp = await Database.addItem(
        Guestbook(
          userId: userId,
          timestamp: timestamp,
          name: name,
          description: description,
          dataDouble: double.tryParse(dataDouble),
          dataInt: int.tryParse(dataInt),
          dataBool: dataBool,
        ),
      );

      return resp;
      
    } catch (e) {
      return "Il y a eu une erreur lors de l'Ajout, essayez encore";
    }
  }
  
  static Future<String> modifierDonnees(Guestbook guestbook) async {
    try {
      String resp = await Database.updateItem(
        Guestbook(
          bookId: guestbook.bookId,
          userId: guestbook.userId,
          timestamp: guestbook.timestamp,
          name: guestbook.name,
          description: guestbook.description,
          dataDouble: guestbook.dataDouble,
          dataInt: guestbook.dataInt,
          dataBool: guestbook.dataBool,
          reste: guestbook.reste,
        ),
      );

      return resp;
    } catch (e) {
      return "Il y a eu une erreur lors de la modification, essayez encore";
    }
  }
  static Future<String> supprimerDonnees(String bookId) async {
    try {
      String resp =  await Database.deleteItem(
        guestbookId: bookId,
      );
      return resp;
    } catch (e) {
      return "Il y a eu une erreur lors de la suppression, essayez encore";
    }
  }
}
