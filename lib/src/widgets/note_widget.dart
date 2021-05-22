import 'package:flutter/material.dart';
import 'package:notes_app/src/models/note_model.dart';
import 'package:notes_app/src/widgets/decorations/card_border.deco.dart';
import 'package:notes_app/src/widgets/decorations/custom_colors_background.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel _model;

  NoteWidget(this._model);

  @override
  Widget build(BuildContext context) {
    final CustomColorBackgrounds colorGenerator = CustomColorBackgrounds();
    final containerHeight = MediaQuery.of(context).size.height * 0.10;
    return Card(
      color: colorGenerator.getCustomColor(),
      shape: CardBorderDeco.roundedBorderDeco,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: ListTile(
                title: Center(
                  child: Text(
                    _model.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                // leading: Icon(
                //   Icons.edit,
                // ),
                onTap: () =>
                    Navigator.pushNamed(context, 'new_note', arguments: _model),
              ),
            ),
            Flexible(child: SizedBox(height: 20.0), flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: Container(
                    height: containerHeight,
                    child: Text(
                      _model.content,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Flexible(child: SizedBox(height: 20.0), flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(_model.modifiedAt),
                  flex: 1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
