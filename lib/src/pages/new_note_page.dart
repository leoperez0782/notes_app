import 'package:flutter/material.dart';
import 'package:notes_app/src/blocs/notes_bloc.dart';
import 'package:notes_app/src/blocs/provider.dart';
import 'package:notes_app/src/models/note_model.dart';

class NewNotePage extends StatefulWidget {
  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final formKey = GlobalKey<FormState>();
  NoteModel model = NoteModel();
  NotesBloc notesBloc;
  @override
  Widget build(BuildContext context) {
    notesBloc = Provider.notesBloc(context);
    final NoteModel noteData = ModalRoute.of(context).settings.arguments;
    if (noteData != null) {
      model = noteData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text((noteData == null) ? 'Nueva nota' : model.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [_createHeader(), _createBody()],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () => {_submit()},
      ),
    );
  }

  Widget _createHeader() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Título'),
      initialValue: (model.title == null) ? "" : model.title,
      textCapitalization: TextCapitalization.sentences,
      onSaved: (value) => model.title = value,
    );
  }

  Widget _createBody() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nota'),
      initialValue: (model.content == null) ? "" : model.content,
      textCapitalization: TextCapitalization.sentences,
      maxLength: null,
      maxLines: 200,
      minLines: 1,
      onSaved: (value) => model.content = value,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;
    //Dispara el save de todos los textFields del form
    formKey.currentState.save();
    if (model.id == null) {
      notesBloc.createNote(model);
    } else {
      notesBloc.updateNote(model);
    }

    Navigator.pushReplacementNamed(context, 'home');
  }
}
