import 'package:flutter/material.dart';

import '../widgets/add_note_form.dart';

class AddHomeScreen extends StatelessWidget {
  const AddHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddHome'),
        centerTitle: true,
      ),

      body:AddNoteForm(),
    );
  }
}
