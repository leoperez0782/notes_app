import 'package:flutter/material.dart';

class MainAppbar extends StatefulWidget {
  @override
  _MainAppbarState createState() => _MainAppbarState();
}

class _MainAppbarState extends State<MainAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Notas'),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }
}
