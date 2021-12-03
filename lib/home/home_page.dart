import 'package:flutter/material.dart';
import 'package:honey_island/expenses/expense_list.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenseList = context.watch<ExpenseList>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Honey Island'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/expenses/add'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Users"),
              onTap: () {
                Navigator.pushNamed(context, '/users');
              },
            )
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: expenseList.expenses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(expenseList.expenses[index].amount.toString()),
              subtitle: Text(expenseList.expenses[index].paidBy.name),
            );
          },
        ),
      ),
    );
  }
}