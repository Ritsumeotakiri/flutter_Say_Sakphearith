import 'package:flutter/material.dart';
import 'package:pratice/W8_S1/boschir/withcontroler/models/expense.dart';

class Dropdownbuttom extends StatefulWidget {
  const Dropdownbuttom({super.key});

  @override
  State<Dropdownbuttom> createState() => _DropdownbuttomState();
}

class _DropdownbuttomState extends State<Dropdownbuttom> {
  @override
  Widget build(BuildContext context) {
    Category? _selectedCategory = Category.food;
    return DropdownButton<Category>(
      value: _selectedCategory,
      items: Category.values.map((Category category) {
        return DropdownMenuItem<Category>(
          value: category,
          child: Text(category.toString().split('.').last),
        );
      }).toList(),
      onChanged: (Category? newCategory) {
        setState(() {
          _selectedCategory = newCategory;
        });
      },
      hint: const Text('Select Category'),
    );
  }
}
