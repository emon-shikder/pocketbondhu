import 'package:flutter/material.dart';
import 'package:pocketbondhu/models/expense.dart';
import 'package:pocketbondhu/pages/add_expense_page.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Expense> _expenses = [];

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  double get _totalExpenses {
    return _expenses.fold(0.0, (sum, e) => sum + e.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'PocketBondhu',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22, // Increase font size for more emphasis
            color: Colors.white, // White text color to stand out
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 10, // Slight elevation for depth
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green[600]!,
                Colors.green[400]!
              ], // Green gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Spent',
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  '৳${_totalExpenses.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _expenses.isEmpty
                ? Center(
                    child: Text(
                      'No expenses yet!',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (ctx, index) {
                      final exp = _expenses[index];
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green[300],
                            child: Text(
                              '৳',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            exp.title,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            '${exp.date.toLocal()}'.split(' ')[0],
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          trailing: Text(
                            '৳${exp.amount}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green[600],
        onPressed: () async {
          final newExpense = await Navigator.push<Expense>(
            context,
            MaterialPageRoute(builder: (context) => AddExpensePage()),
          );
          if (newExpense != null) {
            _addExpense(newExpense);
          }
        },
        label: Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.white, // Make the text white
            fontWeight: FontWeight.bold, // Make the text bold
            fontSize: 16, // Optional: Adjust font size
          ),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white, // Make the icon white
        ),
      ),
    );
  }
}
