import 'package:flutter/material.dart';
import 'package:notes_app/src/blocs/provider.dart';

class HomePageDrawer extends StatefulWidget {
  HomePageDrawer({Key key}) : super(key: key);

  @override
  _HomePageDrawerState createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createMenuHeader(),
          _showButton(Icon(Icons.done), 'Mostrar hechos', _showCompleteNotes),
          _showButton(Icon(Icons.check_box_outline_blank), 'Mostrar pendientes',
              _showUnCompleteNotes),
        ],
      ),
    );
  }

  Widget _createMenuHeader() {
    return DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ));
  }

  Widget _showButton(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text('$title'),
      onTap: onTap,
    );
  }

  _showCompleteNotes() {
    final notesBloc = Provider.notesBloc(context);
    setState(() {
      notesBloc.loadCompletes();
    });
  }

  _showUnCompleteNotes() {
    final notesBloc = Provider.notesBloc(context);

    notesBloc.loadUnCompletes();
  }
}
