import 'package:flutter/material.dart';
import 'package:notes_app/src/blocs/notes_bloc.dart';
import 'package:notes_app/src/blocs/provider.dart';
import 'package:notes_app/src/models/note_model.dart';

class NoteSearch extends SearchDelegate {
  List<String> recentSearchs = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final notesBloc = Provider.notesBloc(context);
    final suggest =
        recentSearchs.where((n) => n.toLowerCase().startsWith(query)).toList();
    return suggest.isEmpty
        ? _loadSuggestions(notesBloc)
        : _showSuggestions(suggest);
  }

  Widget _loadSuggestions(NotesBloc notesbloc) {
    notesbloc.loadByTitle(query);
    return StreamBuilder(
        stream: notesbloc.notesStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<NoteModel>> snapshot) {
          var notes = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Icon(Icons.notes),
                  title: Text(notes[i].title),
                  onTap: () {
                    recentSearchs.add(notes[i].title);
                    close(context, null);
                    Navigator.pushNamed(context, 'new_note',
                        arguments: notes[i]);
                  },
                );
              },
            );
          } else {
            return Container();
          }
        });
  }

  Widget _showSuggestions(List<String> suggest) {
    return ListView.builder(
        itemCount: suggest.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.notes),
            title: Text(suggest[i]),
            onTap: () {},
          );
        });
  }
}
