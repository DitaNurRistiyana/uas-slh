import 'package:flutter/material.dart';
import '../helpers/db_helper.dart';
import '../models/note.dart';

class AddEditScreen extends StatefulWidget {
  final Note? note;
  AddEditScreen({this.note});

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final DBHelper db = DBHelper();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
    }
  }

  void saveNote() async {
    if (widget.note == null) {
      await db.insert(
        Note(title: titleController.text, content: contentController.text),
      );
    } else {
      await db.update(
        Note(
          id: widget.note!.id,
          title: titleController.text,
          content: contentController.text,
        ),
      );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah / Edit")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Judul"),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: "Isi"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: saveNote, child: const Text("Simpan")),
          ],
        ),
      ),
    );
  }
}
