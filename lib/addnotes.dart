import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/home.dart';
import 'size_config.dart';
import 'Notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddNotes extends StatefulWidget {
  final String? noteID;
  const AddNotes({Key? key, this.noteID}) : super(key: key);
  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  String? noteTitle;
  String? noteContent;
  @override
  final _key = GlobalKey<FormState>();

  Widget build (BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
          title: Text(widget.noteID == null ? 'Edit Notes' : 'AddNotes')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the note title';
                        }
                      },
                      onChanged: (_val) {
                        noteTitle = _val;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: 'Note Title'),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the note content';
                          }
                        },
                        onChanged: (_val) {
                          noteContent = _val;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        decoration: InputDecoration(
                          hintText: 'Note Description',
                        )),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(335),
                      height: getProportionateScreenHeight(54),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: add,
                        child: Center(
                          child: Text(
                            'Add Note',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void add() async {
    // save to DB
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Notes');

    var data = {
      'noteTitle': noteTitle,
      'noteContent': noteContent,
      'createdAt': DateTime.now(),
    };

 collectionReference.add(data);

    //

    Navigator.pop(context);
  }
}
