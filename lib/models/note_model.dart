// To parse this JSON data, do
//
//     final noteModel = noteModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class NoteModel {
  NoteModel({
    @required this.title,
    @required this.description,
    @required this.noteState,
    this.id,
  });

  String? title;
  final String? description;
  final String? noteState;
  final String? id;

  factory NoteModel.fromJson(String str, id) =>
      NoteModel.fromMap(json.decode(str), id);

  String toJson() => json.encode(toMap());

  factory NoteModel.fromMap(Map<String, dynamic> json, String id) => NoteModel(
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        noteState: json["noteState"] == null ? null : json["noteState"],
        id: id,
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "noteState": noteState == null ? null : noteState,
      };
}
