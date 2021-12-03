import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense.dart';
import 'package:honey_island/expenses/expense_list.dart';
import 'package:honey_island/guys/guys_list.dart';
import 'package:honey_island/users/user.dart';
import 'package:provider/provider.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({Key? key}) : super(key: key);

  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {

  final _formKey = GlobalKey<FormState>();
  final _descriptionEditingController = TextEditingController();
  final _amountEditingController = TextEditingController();
  var _paidBy;

  @override
  void dispose() {
    _descriptionEditingController.dispose();
    _amountEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final guysList = context.read<GuysList>();
    final expenseList = context.read<ExpenseList>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownButtonFormField<User>(
                decoration: const InputDecoration(
                  labelText: 'Paid By',
                ),
                value: _paidBy,
                onChanged: (value) {
                  setState(() {
                    _paidBy = value;
                  });
                },
                items: guysList.guys.map((guy) {
                  return DropdownMenuItem<User>(
                    value: guy,
                    child: Text(guy.name),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: _descriptionEditingController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter description',
                ),
              ),
              TextFormField(
                controller: _amountEditingController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Enter amount',
                ),
                autofocus: true,
                keyboardType: TextInputType.number,
              ),
            ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final description = _descriptionEditingController.text;
            final amount = double.tryParse(_amountEditingController.text)!;

            final expense = Expense.create(
              paidBy: _paidBy,
              description: description, 
              amount: amount, 
            );

            expenseList.addExpense(expense);

            Navigator.pop(context);
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}