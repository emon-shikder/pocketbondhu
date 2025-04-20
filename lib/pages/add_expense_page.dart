import 'package:flutter/material.dart';
import 'package:pocketbondhu/models/expense.dart';

import 'package:google_fonts/google_fonts.dart';

class AddExpensePage extends StatefulWidget {
  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _submit() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text);

    if (title.isEmpty || amount == null || amount <= 0) {
      return;
    }

    final newExpense = Expense(
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    Navigator.pop(context, newExpense);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Expense',
          style: GoogleFonts.poppins(
            color: Colors.white, // Mak/ Optional: Make it bold for emphasis
          ),
        ),
        backgroundColor: Colors.green[600], // Keep the green background
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Expense Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount (৳)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _submit,
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white, // Ma // Make the text bold
                  fontSize: 16, // Optional: Adjust font size
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
