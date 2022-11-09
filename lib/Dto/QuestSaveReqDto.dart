
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuestSaveReqDto {
  final String? title;
  final String? description;
  final int? exp;
  final int? point;
  final String? class_code;
  final DateTime? pickedstdate;
  final DateTime? pickedenddate;

  QuestSaveReqDto(this.title, this.description, this.exp , this.point,this.class_code, this.pickedstdate, this.pickedenddate);

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "exp": exp,
    "point": point,
    "class_code":class_code,
    "start_date":DateFormat('yyyy-MM-dd').format(pickedstdate!),
    "end_date" :DateFormat('yyyy-MM-dd').format(pickedenddate!),
  };
}

