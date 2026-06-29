import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  String? _amountError;

  void onCheckPressed() {
    String title = _titleController.text.trim();

    double? amount = double.tryParse(_amountController.text);

  
    if (amount == null || amount < 0 || amount > 100) {
      setState(() {
        _amountError = "Amount must be between 0 and 100";
      });
      return;
    }
    setState(() {
      _amountError = null;
    });

    Expense newExpense = Expense(
      amount: amount,
      title: title,
      category: Category.food,
      date: DateTime.now(),
    );

    Navigator.pop(context, newExpense);
  }

  void onCancelPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Expense")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: "Title"),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: InputDecoration(
                prefixText: "\$",
                labelText: "Amount",
                errorText: _amountError,
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onCancelPressed,
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: onCheckPressed,
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
