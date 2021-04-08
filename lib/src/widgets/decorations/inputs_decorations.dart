import 'package:flutter/material.dart';

class InputsDecorations {
  static const appBarTextFieldInputDecoration = InputDecoration(
    hintText: 'Buscar notas',
    hintStyle: TextStyle(color: Colors.white, fontSize: 20.0),
    focusColor: Colors.white,
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  );
}
