import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/View_notes.dart';
import 'package:notes_app/addnotes.dart';
import 'package:notes_app/notedelete.dart';
import 'size_config.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  formatDateTime(DateTime dateTime) {
    return (dateTime);
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Notes');
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        title: Center(child: Text('List of Notes')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotes()));
        },
        child:  Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
          duration: Duration(seconds: 5),
        ),
        child: FutureBuilder<QuerySnapshot>(
          future: collectionReference.get(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    "You have no saved Notes !",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                );
              }

              return Dismissible(
                background: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 24,
                        )),
                  ),
                ),
                key: ValueKey(keepToString),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {},
                confirmDismiss: (direction) async {
                  final result = await showDialog(
                      context: context, builder: (_) => NoteDelete());
                  print(result);
                  return result;
                },
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data() as Map;
                    DateTime myDateTime = data['created'].toDate();
                    String formattedTime =
                        DateFormat('yMMMd').format(myDateTime);

                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => ViewNote(
                              data: data,
                              time: formattedTime,
                              collectionReference:
                                  snapshot.data!.docs[index].reference,
                            ),
                          ),
                        )
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data['title']}",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: "lato",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),

                              //
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  formattedTime,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "lato",
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Text("Loading..."),
              );
            }
          },
        ),
      ),
    );
  }
}
