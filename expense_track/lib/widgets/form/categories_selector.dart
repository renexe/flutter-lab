import 'package:flutter/material.dart';

import 'package:expense_track/models/expense.dart';

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector(
      {super.key,
      required this.onSelectCategory,
      required this.selectedCategory});

  final Function(Category) onSelectCategory;
  final Category? selectedCategory;

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Escolha uma categoria:'),
        const SizedBox(height: 16),
        Center(
          child: Row(
              children: Category.values.map((category) {
            final color = widget.selectedCategory == category
                ? Colors.black
                : Colors.grey.withOpacity(.75);

            return Expanded(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () => widget.onSelectCategory(category),
                      icon: Icon(categoryIcons[category]),
                      color: color),
                  Text(
                    category.name,
                    style: TextStyle(color: color),
                  ),
                ],
              ),
            );
          }).toList()),
        ),
      ],
    );
  }
}
