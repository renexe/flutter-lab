import 'package:flutter/material.dart';

import 'package:expense_track/models/expense.dart';

class ExpensesListItem extends StatelessWidget {
  const ExpensesListItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(expense.title, style: const TextStyle(fontSize: 18)),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text('R\$ ${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expense.formattedDate),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
