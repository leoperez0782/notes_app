import 'package:flutter/material.dart';
import 'package:notes_app/src/models/note_model.dart';

class CustomAppbar extends StatefulWidget with PreferredSizeWidget {
  CustomAppbar({Key key, @required TextEditingController filter})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);
  final TextEditingController filter = TextEditingController();
  @override
  final Size preferredSize;

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
        child: Stack(
          children: [
            AppBar(
              centerTitle: true,
              title: TextField(
                style: new TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Buscar notas',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                  focusColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
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
}
