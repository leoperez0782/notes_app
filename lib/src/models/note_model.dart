import 'dart:convert';

import 'package:notes_app/src/utils/dates_formater_util.dart';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
  NoteModel({
    this.id,
    this.title,
    this.content,
    this.complete,
    this.creationDate,
  }) {
    if (this.complete == null) {
      complete = 0;
    }
    if (this.creationDate == null) {
      this.creationDate =
          DatesFormaterUtil.daysMonthsYearsFormat(DateTime.now());
    }
  }

  int id;
  String title;
  String content;
  int complete;
  String creationDate;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        complete: json["complete"],
        creationDate: json["creationDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "complete": complete,
        "creationDate": creationDate,
      };
}
