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
            title: Text(_model.title),
            leading: (_model.complete == 1)
                ? Icon(Icons.verified)
                : Icon(Icons.check_box_outline_blank),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => print('tap en el icon Button'),
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
