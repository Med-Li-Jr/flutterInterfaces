import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interfaces/Controller/BooksController.dart';
import 'package:flutter_interfaces/Modal/Enitities/GuestBook.dart';
import 'package:flutter_interfaces/Utilities/CustomColor.dart';
import 'package:flutter_interfaces/Utilities/CustomField.dart';
import 'package:flutter_interfaces/Utilities/Validator.dart';

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
  final TextEditingController _dataRestController = TextEditingController();
  bool _radioDataBool = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
                children: <Widget>[
                  Text(
                    'Reste ',
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontSize: 18.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _dataRestController,
                    focusNode: widget.nameFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) => Validator.validateField(
                      value: value,
                    ),
                    label: 'Reste',
                    hint: 'Reste Exemple',
                  ),
                  SizedBox(height: 18.0),
                  // Text(
                  //   'Name',
                  //   style: TextStyle(
                  //     color: CustomColors.textColor,
                  //     fontSize: 18.0,
                  //     letterSpacing: 1,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 7.0),
                  // CustomFormField(
                  //   isLabelEnabled: false,
                  //   controller: _nameController,
                  //   focusNode: widget.nameFocusNode,
                  //   keyboardType: TextInputType.text,
                  //   inputAction: TextInputAction.next,
                  //   validator: (value) => Validator.validateField(
                  //     value: value,
                  //   ),
                  //   label: 'Name',
                  //   hint: 'Enter your note name',
                  // ),
                  // SizedBox(height: 18.0),
                  // Text(
                  //   'Description',
                  //   style: TextStyle(
                  //     color: CustomColors.textColor,
                  //     fontSize: 18.0,
                  //     letterSpacing: 1,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 7.0),
                  // CustomFormField(
                  //   maxLines: 1,
                  //   isLabelEnabled: false,
                  //   controller: _descriptionController,
                  //   focusNode: widget.descriptionFocusNode,
                  //   keyboardType: TextInputType.text,
                  //   inputAction: TextInputAction.done,
                  //   validator: (value) => Validator.validateField(
                  //     value: value,
                  //   ),
                  //   label: 'Description',
                  //   hint: 'Enter your note description',
                  // ),
                  // SizedBox(height: 18.0),
                  // Text(
                  //   'DataDouble',
                  //   style: TextStyle(
                  //     color: CustomColors.textColor,
                  //     fontSize: 18.0,
                  //     letterSpacing: 1,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 7.0),

                  // CustomFormField(
                  //   maxLines: 1,
                  //   isLabelEnabled: false,
                  //   controller: _dataDoubleController,
                  //   focusNode: widget.dataDoubleFocusNode,
                  //   keyboardType: TextInputType.text,
                  //   inputAction: TextInputAction.done,
                  //   validator: (value) => Validator.validateFieldNumber(
                  //       value: value, typeField: "double"),
                  //   label: 'Data Double',
                  //   hint: 'Enter your note data double',
                  // ),

                  // SizedBox(height: 18.0),
                  // Text(
                  //   'DataInt',
                  //   style: TextStyle(
                  //     color: CustomColors.textColor,
                  //     fontSize: 18.0,
                  //     letterSpacing: 1,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 7.0),
                  // CustomFormField(
                  //   maxLines: 1,
                  //   isLabelEnabled: false,
                  //   controller: _dataIntController,
                  //   focusNode: widget.dataIntFocusNode,
                  //   keyboardType: TextInputType.text,
                  //   inputAction: TextInputAction.done,
                  //   validator: (value) => Validator.validateFieldNumber(
                  //       value: value, typeField: "int"),
                  //   label: 'Data Int',
                  //   hint: 'Enter your note data int',
                  // ),
                  // SizedBox(height: 18.0),

                  // Text(
                  //   'DataBool',
                  //   style: TextStyle(
                  //     color: CustomColors.textColor,
                  //     fontSize: 18.0,
                  //     letterSpacing: 1,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 7.0),

                  // //Pour le Type Boolean
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     border: Border.all(
                  //       color: CustomColors.textColor.withOpacity(0.9),
                  //     ),
                  //   ),
                  //   child: Theme(
                  //     data: ThemeData(
                  //       //here change to your color
                  //       unselectedWidgetColor: CustomColors.textColor,
                  //     ),
                  //     child: new Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         new Radio(
                  //           value: true,
                  //           groupValue: _radioDataBool,
                  //           activeColor: CustomColors.secondColor,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               _radioDataBool = value;
                  //             });
                  //           },
                  //         ),
                  //         new Text(
                  //           'True',
                  //           style: new TextStyle(
                  //             fontSize: 16.0,
                  //             color: CustomColors.textColor,
                  //           ),
                  //         ),
                  //         new Radio(
                  //           value: false,
                  //           groupValue: _radioDataBool,
                  //           activeColor: CustomColors.secondColor,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               _radioDataBool = value;
                  //             });
                  //           },
                  //         ),
                  //         new Text(
                  //           'False',
                  //           style: new TextStyle(
                  //               fontSize: 16.0,
                  //               color: CustomColors.textColor),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                
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
                : Row(
                  children: [
                    // Container(
                    //     width: 150,
                    //     child: ElevatedButton(
                    //       style: ButtonStyle(
                    //         backgroundColor: MaterialStateProperty.all(
                    //           CustomColors.secondColor,
                    //         ),
                    //         shape: MaterialStateProperty.all(
                    //           RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10),
                    //           ),
                    //         ),
                    //       ),
                    //       onPressed: () async {
                    //         widget.nameFocusNode.unfocus();
                    //         widget.descriptionFocusNode.unfocus();
                    //         widget.dataDoubleFocusNode.unfocus();
                    //         widget.dataIntFocusNode.unfocus();
                    //         widget.dataBoolFocusNode.unfocus();

                    //         if (_addItemFormKey.currentState.validate()) {
                    //           setState(() {
                    //             _isProcessing = true;
                    //           });

                    //           String resp = await BooksController.ajouterBook(
                    //             "sdf6s51se65",
                    //             DateTime.now().millisecondsSinceEpoch.toString(),
                    //             _nameController.text,
                    //             _descriptionController.text,
                    //             _dataDoubleController.text,
                    //             _dataIntController.text,
                    //             _radioDataBool,
                    //           );

                    //           setState(() {
                    //             _isProcessing = false;
                    //           });
                    //           if (resp != null) {
                    //             // ScaffoldMessenger.
                    //             ScaffoldMessenger(
                    //               child: SnackBar(
                    //                 content: Text(resp),
                    //               ),
                    //             );
                    //           } else {
                    //             Navigator.of(context).pop();
                    //           }
                    //         }
                    //       },
                    //       child: Padding(
                    //         padding: EdgeInsets.all(11),
                    //         child: Text(
                    //           'ADD ITEM',
                    //           style: TextStyle(
                    //             fontSize: 21,
                    //             fontWeight: FontWeight.bold,
                    //             color: CustomColors.thirdColor,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    Container(
                        width: 150,
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

                              setState(() {
                                _isProcessing = true;
                              });

                            String idChantier = "sdf6s51se6";
                            double ancienRestChantier = 0; // tu aura besoin de la valeur du reste actuelle avant l'ajout du nouveau artisan pour pouvoir calculer le nouveau reste
                            double nouveauMontantArtisan = 100; // la valeur du montant du nouveau artisant
                            
                            //cette ligne en dessous va te retourner un chantier en passant son Id ou key qui doit etre unique et exisatant dans la table Chantier
                            QuerySnapshot<Map<String, dynamic>> allDocUser = await BooksController.obtenirLesDonneesByIdUser(idChantier);
                            
                            Guestbook chantier;
                            //cela donne toujours une liste donc on va parcourir a un FOR
                            for (var doc in allDocUser.docs) {
                              if (doc.data() != null) {
                                Map<String, dynamic> data = doc.data();
                                chantier = Guestbook.fromJson(data); // on convertir les données en notre classe avec la fonction qu'on a crée dans la classe
                                print(" -----------------------------------------  ");
                              }
                            }
                            //on calcule le nouveau reste en prennant l'ancien reste avant ajout du nouveau artisan moins le montant du nouveau artisant
                            double nouveauResteChantier = chantier.reste - nouveauMontantArtisan;
                            chantier.reste = nouveauResteChantier;

                            //lorsque tu finir d'ajouter le nouveau artisan et si cela a reussir n'oubli pas de sauvegarder la nouvelle valeur du chantier dans FireBase
                            BooksController.modifierDonnees(chantier);



                              setState(() {
                                _isProcessing = false;
                                _dataRestController.text = nouveauResteChantier.toString();
                              });
                            
                          },
                          child: Padding(
                            padding: EdgeInsets.all(11),
                            child: Text(
                              'Get Rest',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.thirdColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                  
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
