import 'package:flutter/material.dart';
import 'package:notes_app/src/blocs/notes_bloc.dart';
import 'package:notes_app/src/blocs/provider.dart';
import 'package:notes_app/src/models/note_model.dart';
import 'package:notes_app/src/widgets/custom_search_appbar.dart';
import 'package:notes_app/src/widgets/note_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> _notes = [];

  @override
  Widget build(BuildContext context) {
    final notesBloc = Provider.notesBloc(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notas'),
        centerTitle: true,
      ),
      body: Scaffold(
        appBar: PreferredSize(
          child: CustomSearchAppbar(),
          preferredSize: Size(double.infinity, 50.0),
        ),
        body: _createNoteList(notesBloc),
      ),
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
            this._notes = snapshot.data;
            return ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, i) =>
                    _createItem(_notes[i], notesBloc, i));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _createItem(NoteModel note, NotesBloc notesBloc, int index) {
    return Dismissible(
      key: UniqueKey(),
      child: NoteWidget(note),
      onDismissed: (direction) {
        deleteNote(notesBloc, note, index);
      },
    );
  }

  void deleteNote(NotesBloc notesBloc, NoteModel note, int index) {
    notesBloc.deleteNote(note).then((value) => {
          setState(() {
            _notes.removeAt(index);
          })
        });
  }
}
