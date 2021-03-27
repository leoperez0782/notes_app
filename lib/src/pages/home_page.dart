import 'package:flutter/material.dart';
import 'package:notes_app/src/blocs/notes_bloc.dart';
import 'package:notes_app/src/blocs/provider.dart';
import 'package:notes_app/src/models/note_model.dart';
import 'package:notes_app/src/widgets/custom_appbar.dart';
import 'package:notes_app/src/widgets/note_widget.dart';

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
      appBar: CustomAppbar(),
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
                itemBuilder: (context, i) =>
                    _createItem(notes[i], notesBloc, notes, i));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _createItem(
      NoteModel note, NotesBloc notesBloc, List<NoteModel> notes, int index) {
    return Dismissible(
      key: UniqueKey(),
      child: NoteWidget(note),
      onDismissed: (direction) {
        notesBloc.deleteNote(note).then((value) => {
              setState(() {
                notes.removeAt(index);
              })
            });
      },
    );
  }
}
