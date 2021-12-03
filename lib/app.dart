
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:honey_island/expenses/add_expense_page.dart';
import 'package:honey_island/expenses/expense_list.dart';
import 'package:honey_island/expenses/expense_repository.dart';
import 'package:honey_island/home/home_page.dart';
import 'package:honey_island/users/user_list.dart';
import 'package:honey_island/users/user_page.dart';
import 'package:honey_island/users/user_repository.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;
  final ExpenseRepository expenseRepository;

  const App({
    Key? key, 
    required this.userRepository,
    required this.expenseRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserList>(
          create: (_) => UserList(repository: userRepository),
        ),
        ChangeNotifierProvider<ExpenseList>(
          create: (_) => ExpenseList(repository: expenseRepository),
        )
      ],
      child: MaterialApp(
        title: 'Honey Island',
        theme: ThemeData.dark(),
        initialRoute: '',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomePage(),
          '/users': (context) => const UserPage(),
          '/expenses/add': (context) => const AddExpensePage(),
        },
      ),
    );
  }
}
