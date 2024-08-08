import 'package:flutter/material.dart';

class NoteDelete extends StatefulWidget {
  const NoteDelete({Key? key}) : super(key: key);


  @override
  State<NoteDelete> createState() => _NoteDeleteState();
}


class _NoteDeleteState extends State<NoteDelete> {
  bool delete= false;
  @override
  Widget build(BuildContext context) {
    return
      AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want to delete this note ?'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Yes')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'))
      ],
    );
  }
}
