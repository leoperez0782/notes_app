import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  CustomAppbar({Key key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
        child: Stack(
          children: [
            AppBar(
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar notas',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              actions: [],
              elevation: 10.0,
              leading: Container(
                padding: EdgeInsets.only(bottom: 5.0),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
