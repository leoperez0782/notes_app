import 'package:flutter/material.dart';

class NewNotePage extends StatefulWidget {
  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva nota'),
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
        onPressed: () {},
      ),
    );
  }

  Widget _createHeader() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Título'),
      initialValue: "",
      textCapitalization: TextCapitalization.sentences,
    );
  }

  Widget _createBody() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nota'),
      initialValue: "",
      textCapitalization: TextCapitalization.sentences,
      maxLength: null,
      maxLines: 200,
    );
  }
}
