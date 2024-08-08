import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
   String? noteID;
   String ?noteTitle;
   String? noteContent;
   Timestamp? createdAt;

  Note(this.noteID, this.noteTitle, this.noteContent, this.createdAt);

Note.fromMap(Map<String,dynamic>data){
  noteID = data['noteID'];
  noteTitle = data['noteTitle'];
  noteContent = data['noteContent'];
  createdAt = data['createdAt'];

}
  }

