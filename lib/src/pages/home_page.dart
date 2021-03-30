import 'package:flutter/material.dart';
import 'package:notes_app/src/blocs/notes_bloc.dart';
import 'package:notes_app/src/blocs/provider.dart';
import 'package:notes_app/src/models/note_model.dart';
import 'package:notes_app/src/widgets/decorations/inputs_decorations.dart';
import 'package:notes_app/src/widgets/note_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> _notes = [];
  String _searchText;
  final TextEditingController _filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notesBloc = Provider.notesBloc(context);

    _prepareTextController(notesBloc);
    return Scaffold(
      appBar: PreferredSize(
        child: _createAppbar(),
        preferredSize: Size(double.infinity, 50.0),
      ),
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
        notesBloc.deleteNote(note).then((value) => {
              setState(() {
                _notes.removeAt(index);
              })
            });
      },
    );
  }

  Widget _createAppbar() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
        child: Stack(
          children: [
            AppBar(
              centerTitle: true,
              title: TextField(
                controller: _filter,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                autofocus: true,
                decoration: InputsDecorations.appBarTextFieldInputDecoration,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              actions: [
                Container(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ],
              elevation: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  void _prepareTextController(NotesBloc notesBloc) {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          notesBloc.loadNotes();
        });
      } else {
        setState(() {
          _searchText = _filter.text;
          // _notes =
          //     _notes.where((n) => n.title.startsWith(_searchText)).toList();
          notesBloc.loadByTitle(_searchText);
          print('Notas desde search ${_notes.length}');
        });
      }
    });
  }
}
