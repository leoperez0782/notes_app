import 'package:flutter/material.dart';
import 'package:notes_app/src/models/note_model.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel _model;

  NoteWidget(this._model);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Center(child: Text(_model.title)),
            leading: Icon(
              Icons.edit,
            ),
            trailing: SizedBox(
              width: 30,
            ),
            onTap: () =>
                Navigator.pushNamed(context, 'new_note', arguments: _model),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_model.content),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(_model.creationDate)],
          )
        ],
      ),
    ));
  }
}
