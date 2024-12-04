import 'package:flutter/material.dart';
import 'package:pratice/W8_S2/models/expense.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  void onCancel() {
    Navigator.pop(context);
  }

  void onAdd() {
    // Get the input value and convert it
    if (_valueController.text.isNotEmpty) {
      final double amount = double.tryParse(_valueController.text) ?? 0.0;

      if (amount > 0) {
        double convertedAmount = convertMoney(amount, _selectedMoneyType!);

        // Update the converted amount in the text field
        setState(() {
          _convertController.text =
              '${convertedAmount.toStringAsFixed(2)} ${_selectedMoneyType.toString().split('.').last}';
        });
      } else {
        // Show error if the input is invalid
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid amount')),
        );
      }
    }
  }

  // Convert function for currency
  double convertMoney(double amount, moneytype type) {
    // Placeholder conversion logic (update with real logic)
    if (type == moneytype.Dollar) {
      return amount * 1.0; // Dollar to Dollar, no change
    } else if (type == moneytype.Euro) {
      return amount * 0.85; // Example: Dollar to Euro
    } else if (type == moneytype.pound) {
      return amount * 0.75; // Example: Dollar to Pound
    }
    return amount;
  }

  final _valueController = TextEditingController();
  final _convertController = TextEditingController();

  moneytype? _selectedMoneyType = moneytype.Dollar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _valueController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text("amout"),
              ),
            ),
            DropdownButton<moneytype>(
              value: _selectedMoneyType,
              items: moneytype.values.map((moneytype moneytypes) {
                return DropdownMenuItem<moneytype>(
                  value: moneytypes,
                  child: Text(moneytypes.toString().split('.').last),
                );
              }).toList(),
              onChanged: (moneytype? newmoneytype) {
                setState(() {
                  _selectedMoneyType = newmoneytype;
                });
              },
              hint: const Text('Select Category'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: onCancel, child: const Text('Cancel')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: onAdd, child: const Text('Create')),
              ],
            ),
            Text('converted amount'),
            TextField(
              controller: _convertController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: "Converted Amount",
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
