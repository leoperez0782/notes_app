import 'package:flutter/material.dart';
import 'package:notes_app/src/blocs/notes_bloc.dart';
import 'package:notes_app/src/blocs/provider.dart';
import 'package:notes_app/src/models/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final notesBloc = Provider.notesBloc(context);
    notesBloc.loadNotes();
    return Scaffold(
      body: _createNoteList(notesBloc),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, 'new_note')},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _createNoteList(NotesBloc notesBloc) {
    return StreamBuilder(
        stream: notesBloc.notesStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<NoteModel>> snapshot) {
          if (snapshot.hasData) {
            final notes = snapshot.data;
            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, i) => _createItem(notes[i]));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _createItem(NoteModel note) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.content),
      onTap: () {},
    );
  }
}
