import 'package:expenses_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker_app/utils/utils.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.food;

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _onCalendarDisplay() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void onDropdownChanged(value) {
    if (value == null) {
      return;
    }
    setState(() {
      selectedCategory = value;
    });
  }

  void _onSaveExpense() {
    final titleValue = _titleController.text.trim().isEmpty;
    final parseAmountValue = double.tryParse(_amountController.text);
    if (titleValue ||
        parseAmountValue == null ||
        parseAmountValue <= 0 ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Input Errors'),
          content:
              const Text('Please enter a title, an amount and select a date'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: parseAmountValue,
        date: selectedDate!,
        category: selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose;
    _amountController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 35, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDate == null
                        ? "Select a Date"
                        : formatDate(selectedDate!)),
                    IconButton(
                      onPressed: _onCalendarDisplay,
                      iconSize: 24,
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ], //
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map(
                      (category) => (DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      )),
                    )
                    .toList(),
                onChanged: onDropdownChanged,
              ),
              const Spacer(),
              TextButton(onPressed: _handleCancel, child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _onSaveExpense,
                child: const Text("Save Expense"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
