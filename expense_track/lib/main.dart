import "package:flutter/material.dart";

import 'package:expense_track/widgets/expenses.dart';
import 'package:expense_track/themes/main_theme.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Registro de despesas',
      theme: MainTheme().theme,
      home: const Expenses(),
    ),
  );
}
