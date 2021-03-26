import 'package:flutter/cupertino.dart';
import 'package:notes_app/src/blocs/notes_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;
  final NotesBloc _notesBloc = NotesBloc();
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  static NotesBloc notesBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._notesBloc;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
