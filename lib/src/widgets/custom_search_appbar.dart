import 'package:flutter/material.dart';
import 'package:notes_app/src/blocs/notes_bloc.dart';
import 'package:notes_app/src/blocs/provider.dart';
import 'package:notes_app/src/widgets/decorations/inputs_decorations.dart';

class CustomSearchAppbar extends StatefulWidget {
  CustomSearchAppbar({Key key}) : super(key: key);

  @override
  _CustomSearchAppbarState createState() => _CustomSearchAppbarState();
}

class _CustomSearchAppbarState extends State<CustomSearchAppbar> {
  final TextEditingController _filter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final notesBloc = Provider.notesBloc(context);

    _prepareTextController(notesBloc);

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
          notesBloc.loadNotes();
        });
      } else {
        setState(() {
          notesBloc.loadByTitle(_filter.text);
        });
      }
    });
  }
}
