import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_tracker_app/models/expense.dart';

String formatDate(DateTime date) {
  return DateFormat.yMd().format(date);
}

const categoryIcons = {
  Category.food: Icons.dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work
};
