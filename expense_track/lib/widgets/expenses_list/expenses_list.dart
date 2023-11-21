import 'package:flutter/material.dart';

import 'package:expense_track/models/expense.dart';

import 'package:expense_track/widgets/expenses_list/expenses_list_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) => onRemove(expenses[index]),
          child: ExpensesListItem(expense: expenses[index])),
    );
  }
}
