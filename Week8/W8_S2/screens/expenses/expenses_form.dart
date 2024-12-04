import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';
import 'package:intl/intl.dart'; // Import to format the date

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();

  Category? _selectedCategory = Category.food; // Default category

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    _dateController.dispose(); // Dispose of the date controller as well
    super.dispose();
  }

  // Select date from the DatePicker
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        // Format the date using the DateFormat package
        _dateController.text = DateFormat('yyyy-MM-dd').format(_picked);
      });
    }
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onAdd() {
    String title = _titleController.text;
    double? amount = double.tryParse(_valueController.text);

    // Ensure the date is selected before creating the Expense
    DateTime? selectedDate;
    if (_dateController.text.isNotEmpty) {
      selectedDate = DateTime.tryParse(_dateController.text);
    }

    bool isTitleValid = title.trim().isNotEmpty;
    bool isAmountValid = amount != null && amount > 0;
    bool valid = isTitleValid && isAmountValid && selectedDate != null;

    if (valid) {
      // Create the Expense object with the selected date
      Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate, // Use the selected date
        category: _selectedCategory!, // Use the selected category
      );

      // Pass the created expense to the parent widget
      widget.onCreated(expense);
      Navigator.pop(context);
    } else {
      // Show error message if input is invalid
      String errorMessage = !isTitleValid
          ? "The title cannot be empty"
          : !isAmountValid
              ? "The amount shall be a positive number"
              : "Please select a valid date";

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title input field
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          // Amount input field
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          // Date input field, now tapping it will open a date picker
          GestureDetector(
            onTap: _selectDate,
            child: AbsorbPointer(
              child: TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                readOnly:
                    true, // The field is read-only, user selects date through the picker
              ),
            ),
          ),
          // Category Dropdown
          DropdownButton<Category>(
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
          ),
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          ),
        ],
      ),
    );
  }
}
