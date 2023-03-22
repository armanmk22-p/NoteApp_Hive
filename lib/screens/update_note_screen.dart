import 'package:flutter/material.dart';

import '../model/note.dart';
import '../widgets/update_note_form.dart';

class UpdateNoteScreen extends StatefulWidget {
  final int index;
  final Note note;

  const UpdateNoteScreen({Key? key,required this.index,required this.note}) : super(key: key);

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('UpdateNote'),
        centerTitle: true,
      ),
      body:UpdateNoteForm(index: widget.index, note: widget.note,),
    );
  }
}
