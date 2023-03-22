import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_todo/model/note.dart';

class UpdateNoteForm extends StatefulWidget {

  final int index;
  final Note note;

  const UpdateNoteForm({Key? key,required this.index, required this.note}) : super(key: key);

  @override
  State<UpdateNoteForm> createState() =>_UpdateNoteFormState();
}

class _UpdateNoteFormState extends State<UpdateNoteForm> {

  late final  _titleController;
  late final _descriptionController;
  final _upDateNoteFormKey = GlobalKey<FormState>();
  late final Box box;

  String? _formValidator(String? entry){
    if(entry == null || entry.isEmpty){
      return 'Filed Can\'t  Be Empty';
    }
    return null;
  }

  // Update info of people box
  _updateNote() {
      final updateNote = Note(
      title: _titleController.text,
      description: _descriptionController.text);
      box.putAt(widget.index, updateNote);
  }

  @override
  void initState() {
    super.initState();
    //get reference to Box
    box = Hive.box('noteBox');
    //initialize fiels
    _titleController = TextEditingController(text:widget.note.title);
    _descriptionController = TextEditingController(text: widget.note.description);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _upDateNoteFormKey,
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
              if(_upDateNoteFormKey.currentState!.validate()){
                _updateNote();
                Navigator.of(context).pop();
              }
            }, child:Text('+ Update Note'), style: ElevatedButton.styleFrom(
              maximumSize: Size(200, 60),
            ),)
          ],
        ),
      ),
    );
  }
}
