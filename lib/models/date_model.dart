// To parse this JSON data, do
//
//     final dateModal = dateModalFromJson(jsonString);

import 'dart:convert';

DateModal dateModalFromJson(String str) => DateModal.fromJson(json.decode(str));

String dateModalToJson(DateModal data) => json.encode(data.toJson());

class DateModal {
  DateModal({
    this.date,
  });

  DateTime? date;

  factory DateModal.fromJson(Map<String, dynamic> json) => DateModal(
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date!.toIso8601String(),
      };
}
