import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewNote extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference collectionReference;

  ViewNote({
    required this.data,
    required this.time,
    required this.collectionReference
  });

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  String? noteTitle;
  String ? noteContent;
  bool edit = false;
  GlobalKey<FormState>key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    noteTitle = widget.data['noteTitle'];
    noteContent = widget.data['noteContent'];
    return Scaffold(
      floatingActionButton: edit
          ? FloatingActionButton(
        onPressed: save,
        child: Icon(
          Icons.save_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[700],
      )
          : null,
      //
      resizeToAvoidBottomInset: false,
      //
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(
            20.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 24.0,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            edit = !edit;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          size: 24.0,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.grey[700],
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 8.0,
                            ),
                          ),
                        ),
                      ),
                      //
                      SizedBox(
                        width: 8.0,
                      ),
                      //

                    ],
                  ),
                ],
              ),
              //
              SizedBox(
                height: 12.0,
              ),
              //
              Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Title",
                      ),
                      style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      initialValue: widget.data['noteTitle'],
                      enabled: edit,
                      onChanged: (_val) {
                        noteTitle = _val;
                      },
                      validator: (_val) {
                        if (_val!.isEmpty) {
                          return "Can't be empty !";
                        } else {
                          return null;
                        }
                      },
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                      ),
                      child: Text(
                        widget.time,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "lato",
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Note Description",
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "lato",
                        color: Colors.grey,
                      ),
                      initialValue: widget.data['noteContent'],
                      enabled: edit,
                      onChanged: (_val) {
                        noteContent = _val;
                      },
                      maxLines: 20,
                      validator: (_val) {
                        if (_val!.isEmpty) {
                          return "Can't be empty !";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void save() async {
    if (key.currentState!.validate()) {
      await widget.collectionReference.update(
        {'noteTitle': noteTitle, 'noteContent': noteContent},
      );
      Navigator.of(context).pop();
    }
  }
}
