import 'package:expenses_tracker_app/widgets/expenses_list/expense_list.dart';
import "package:expenses_tracker_app/widgets/new_expenses.dart";
import "package:flutter/material.dart";
import "package:expenses_tracker_app/models/expense.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      amount: 19.33,
      title: "flutter course",
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      amount: 23.33,
      title: "Cinema",
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openModalOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        addExpensetoExpenselist: _newExpenseDataAdded,
      ),
    );
  }

  void _newExpenseDataAdded(Expense newData) {
    setState(() {
      _registeredExpense.add(newData);
    });
  }

  void _removeExpenseData(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No Expense item ,Kindly Add!'),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpense,
        onRemoveExpense: _removeExpenseData,
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Flutter ExpenseTracker",
            textAlign: TextAlign.left,
          ),
          actions: [
            IconButton(
              onPressed: _openModalOverlay,
              icon: const Icon(Icons.add),
            ),
          ]),
      body: Column(
        children: [
          const Text('Chart preperation'),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
