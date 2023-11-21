import 'package:expense_track/widgets/expenses_list/expenses_list.dart';
import "package:expense_track/widgets/new_expense_form.dart";
import "package:flutter/material.dart";

import "package:expense_track/models/expense.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Larica",
        amount: 54.21,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Passargada",
        amount: 333.22,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "Cinema",
        amount: 15.23,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _addExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: NewExpenseForm(onSubmit: _addExpense),
        ),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.insert(0, expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Despesa removida com sucesso!"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de despesas"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 52),
          Expanded(
              child: ExpensesList(
                  expenses: _registeredExpenses, onRemove: _removeExpense)),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16),
            child: FloatingActionButton(
              onPressed: _addExpenseOverlay,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
