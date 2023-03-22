import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_todo/model/note.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addNoteFormKey = GlobalKey<FormState>();
  late final Box box;

  String? _formValidator(String? entry){
    if(entry == null || entry.isEmpty){
      return 'Filed Can\'t  Be Empty';
    }
    return null;
  }

  _addNote() async{
    final newNote =  await Note(title: _titleController.text, description: _descriptionController.text);
    box.add(newNote);
  }

  @override
  void initState() {
    super.initState();
    //get reference to Box
    box = Hive.box('noteBox');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addNoteFormKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text('Title',style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 10,),
            TextFormField(controller:_titleController ,validator:_formValidator ,),
            SizedBox(height: 30,),
            Text('Description',style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 10.0,),
            TextFormField(controller:_descriptionController ,validator:_formValidator ,),
            SizedBox(height: 30.0,),
            ElevatedButton(onPressed: (){
              if(_addNoteFormKey.currentState!.validate()){
                _addNote();
                Navigator.of(context).pop();
              }
            }, child:Text('+ Add Note'), style: ElevatedButton.styleFrom(
              maximumSize: Size(200, 60),
            ),)
          ],
        ),
      ),
    );
  }
}
