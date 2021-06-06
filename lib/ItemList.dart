import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/CustomColor.dart';
import 'package:flutter_interfaces/DatabaseFB.dart';
import 'package:flutter_interfaces/EditScreen.dart';
import 'package:flutter_interfaces/GuestBook.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var dataFB = snapshot.data.docs[index];
              String dataId = snapshot.data.docs[index].id;

              var currentBook = Guestbook(
                userId: dataFB["userId"].toString(),
                timestamp: dataFB["timestamp"].toString(),
                description: dataFB["description"].toString(),
                name: dataFB["name"].toString(),
                dataDouble: double.parse(dataFB["dataDouble"].toString()),
                dataInt: int.parse(dataFB["dataInt"].toString()),
                dataBool: dataFB["dataBool"].toString() == "true",
              );
              currentBook.bookId = dataId;

              return Ink(
                decoration: BoxDecoration(
                  color: CustomColors.itemListColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: ListTile(
                  title: Text(
                    currentBook.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    currentBook.description,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditScreen(
                          currentGuestBook: currentBook,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                      backgroundImage: new AssetImage("images/owl-2.jpg")),
                  trailing: Container(
                    width: 30,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.edit_rounded),
                            color: Colors.green[400],
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditScreen(
                                    currentGuestBook: currentBook,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Expanded(
                        //   child: IconButton(
                        //     icon: Icon(Icons.delete_rounded),
                        //     color: Colors.red[400],
                        //     onPressed: () {
                        //       Scaffold.of(context).showSnackBar(
                        //         SnackBar(
                        //           content: Text(
                        //               'delete pressed! ' + currentBook.name),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),

                //  ListTile(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(7.0),
                //   ),
                //   onTap: () => Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => EditScreen(
                //         currentGuestBook: currentBook,
                //       ),
                //     ),
                //   ),
                //   title: Text(
                //     currentBook.name,
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                //   subtitle: Text(
                //     currentBook.text,
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.secondColor,
            ),
          ),
        );
      },
    );
  }
}
