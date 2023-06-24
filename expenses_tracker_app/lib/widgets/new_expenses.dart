import 'package:flutter/material.dart';
import 'package:expenses_tracker_app/models/expense.dart';

class NewExpense extends StatefulWidget {
   const NewExpense({super.key, required this.addExpensetoExpenselist});

  final void Function(Expense expense) addExpensetoExpenselist;

  @override
  State<NewExpense> createState() => _NewExpenseWidget();
}

void alertMethod() {}

class _NewExpenseWidget extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _onSelectedDate;
  Category? _onSelectCategory;
  bool _isCategorySelected = false;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDstePicker() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _onSelectedDate = pickedDate;
    });
  }

  void _saveExpenseData() {
    final amountData = double.tryParse(_amountController.text);
    final isAmount = amountData == null || amountData <= 0;
    if (_titleController.text.trim().isEmpty ||
        isAmount ||
        _onSelectedDate == null || !_isCategorySelected) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    " Please make sure a valid Title ,amount ,date and Category to be Selected"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Close"))
                ],
              ));
              return;
    }
    widget.addExpensetoExpenselist(Expense(amount: amountData, title: _titleController.text, date: _onSelectedDate!, category: _onSelectCategory!));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text("Title"),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text("\$ "),
                  label: Text("Amount"),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text((_onSelectedDate == null)
                      ? "No Date Selected"
                      : formatter.format(_onSelectedDate!)),
                  IconButton(
                      onPressed: _presentDstePicker,
                      icon: const Icon(Icons.calendar_month)),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            DropdownButton( 
                iconEnabledColor: Colors.blueAccent,

                //dropdownColor: Theme.of(context).dropdownMenuTheme,
                value: _onSelectCategory,
                hint: const Text("Category"),
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                   _isCategorySelected = true;
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _onSelectCategory = value;
                  });
                }),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _saveExpenseData,
              child: const Text("Save Expense"),
            ),
          ],
        )
      ]),
    );
  }
}
