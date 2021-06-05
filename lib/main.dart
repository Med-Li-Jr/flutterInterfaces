import 'package:flutter/material.dart';
import 'package:flutter_interfaces/AddScreen.dart';
import 'package:flutter_interfaces/DashboardScreen.dart';
import 'package:flutter_interfaces/DetailUpdate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: DashboardScreen(),
    );
  }

}
// class DashboardMessages extends StatefulWidget {
//   @override
//   _DashboardMessagesState createState() => _DashboardMessagesState();
// }

// class _DashboardMessagesState extends State<DashboardMessages> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text("Interfaces List"),
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(right: 8.0, left: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.centerRight,
//                   ),
//                   ButtonTheme(
//                     padding: EdgeInsets.all(0),
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         // Respond to button press
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => AddView(),
//                           ),
//                         );
//                       },
//                       icon: Icon(Icons.add, size: 18),
//                       label: Text("Ajouter"),
//                     ),
//                   ),
//                   Divider(color: Colors.green[800]),
//                 ],
//               ),
//             ),
//             Container(
//               child: ItemList(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ItemList extends StatelessWidget {
 
//   final titles = [
//     "List 1",
//     "List 2",
//     "List 3",
//     "List 4",
//     "List 5",
//     "List 6",
//     "List 7",
//     "List 8",
//     "List 9",
//     "List 10",
//     "List 11",
//     "List 12"
//   ];
  
//   final subtitles = [
//     "Here is list 1 subtitle",
//     "Here is list 2 subtitle",
//     "Here is list 3 subtitle",
//     "Here is list 4 subtitle",
//     "Here is list 5 subtitle",
//     "Here is list 6 subtitle",
//     "Here is list 7 subtitle",
//     "Here is list 8 subtitle",
//     "Here is list 9 subtitle",
//     "Here is list 10 subtitle",
//     "Here is list 11 subtitle",
//     "Here is list 12 subtitle"
//   ];
  
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//           //separatorBuilder: (BuildContext context, int index) => const Divider(),
//           itemCount: titles.length,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: EdgeInsets.only(right: 5.0, left: 5.0),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(4.0),
//                   ),
//                   side: BorderSide(color: Colors.green[500], width: 0.2),
//                 ),
//                 child: ListTile(
//                   title: Text(titles[index]),
//                   subtitle: Text(subtitles[index]),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailUpdateVew(message: subtitles[index]),
//                       ),
//                     );
//                   },
//                   leading: CircleAvatar(
//                       backgroundImage: new AssetImage("images/owl-2.jpg")),
//                   trailing: Container(
//                     width: 60,
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: IconButton(
//                             icon: Icon(Icons.edit_rounded),
//                             color: Colors.green[400],
//                             onPressed: () {
//                               Scaffold.of(context).showSnackBar(
//                                 SnackBar(
//                                   content:
//                                       Text('editer pressed! ' + titles[index]),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Expanded(
//                           child: IconButton(
//                             icon: Icon(Icons.delete_rounded),
//                             color: Colors.red[400],
//                             onPressed: () {
//                               Scaffold.of(context).showSnackBar(
//                                 SnackBar(
//                                   content:
//                                       Text('delete pressed! ' + titles[index]),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }

// }
