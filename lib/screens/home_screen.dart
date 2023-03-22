import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/screens/update_note_screen.dart';

import 'add_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('noteBox');
  }

  // Delete info from people box
  _deleteInfo(int index) {
    box.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddHomeScreen(),
            ),
          );
        },
        child: Icon(Icons.add_rounded),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
                child: Text('There is Nothing To Show You',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold)));
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var note = box.getAt(index);
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (_) => UpdateNoteScreen(index: index, note: note)
                    ));
                  },
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    trailing: IconButton(
                      onPressed: () {
                        _deleteInfo(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
