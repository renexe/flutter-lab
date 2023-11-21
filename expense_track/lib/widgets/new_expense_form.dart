import 'package:expense_track/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import 'package:expense_track/models/expense.dart';
import 'package:expense_track/widgets/form/categories_selector.dart';

class NewExpenseForm extends StatefulWidget {
  const NewExpenseForm({super.key, required this.onSubmit});

  final void Function(Expense expense) onSubmit;

  @override
  State<NewExpenseForm> createState() => _NewExpenseFormState();
}

class _NewExpenseFormState extends State<NewExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;
  final errors = {
    'title': false,
    'amount': false,
    'date': false,
    'category': false,
  };
  final _formKey = GlobalKey<FormState>();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now,
        builder: (context, child) => Theme(
              data: ThemeData.light().copyWith(
                colorScheme: colorScheme,
                primaryColor: colorScheme.primary,
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor:
                          colorScheme.onBackground // button text color
                      ),
                ),
              ),
              child: child!,
            ));

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _selectCategory(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _submitExpense() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0.0;

    final isValid = _validadeForm();
    if (!isValid) {
      return;
    }

    final newExpense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory!,
    );

    widget.onSubmit(newExpense);

    Navigator.pop(context);
  }

  bool _validadeForm() {
    var isValid = true;
    if (_titleController.text.isEmpty) {
      setState(() {
        errors['title'] = true;
      });
      isValid = false;
    }
    if (_amountController.text.isEmpty) {
      setState(() {
        errors['amount'] = true;
      });
      isValid = false;
    }
    if (_selectedDate == null) {
      setState(() {
        errors['date'] = true;
      });
      isValid = false;
    }
    if (_selectedCategory == null) {
      setState(() {
        errors['category'] = true;
      });
      isValid = false;
    }
    return isValid;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              "Inserir nova despesa",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.edit),
                filled: true,
                hintText: 'Informe um título',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              maxLength: 50,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Você precisa preencher esse campo';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      CurrencyTextInputFormatter(name: 'R\$ ')
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.attach_money),
                      filled: true,
                      hintText: 'R\$ 0,00',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'É preciso informar o valor';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: _presentDatePicker,
                    controller: TextEditingController(
                      text: _selectedDate == null
                          ? ''
                          : formatter.format(_selectedDate!),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      hintText: 'Data',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Favor informar a data';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            CategoriesSelector(
              onSelectCategory: _selectCategory,
              selectedCategory: _selectedCategory,
            ),
            const SizedBox(height: 32),
            Container(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submitExpense();
                  }
                },
                backgroundColor: colorScheme.primary,
                child: const Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
