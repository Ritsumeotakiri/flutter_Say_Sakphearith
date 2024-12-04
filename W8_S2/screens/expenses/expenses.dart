import 'package:flutter/material.dart';
import 'package:pratice/W8_S2/screens/expenses/DeviceConverter.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];
  Expense? removedExpense;
  void onExpenseRemoved(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
      removedExpense = expense;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${expense.title} removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              // Undo the removal by re-adding the expense back
              _registeredExpenses.add(removedExpense!);
              removedExpense = null; // Reset removed expense
            });
          },
        ),
      ),
    );
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }

  void onAddPresseds() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const Converter(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPresseds,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _registeredExpenses.isEmpty
          ? const Center(
              child: Text(
                'No expenses added yet!',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          : ExpensesList(
              expenses: _registeredExpenses,
              onExpenseRemoved: onExpenseRemoved,
            ),
    );
  }
}
