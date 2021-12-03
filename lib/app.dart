
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:honey_island/expenses/add_expense_page.dart';
import 'package:honey_island/expenses/expense_list.dart';
import 'package:honey_island/expenses/expense_repository.dart';
import 'package:honey_island/guys/guys_list.dart';
import 'package:honey_island/guys/guys_page.dart';
import 'package:honey_island/guys/guys_repository.dart';
import 'package:honey_island/home/home_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final GuysRepository guysRepository;
  final ExpenseRepository expenseRepository;

  const App({
    Key? key, 
    required this.guysRepository,
    required this.expenseRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GuysList>(
          create: (_) => GuysList(repository: guysRepository),
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
          '/guys': (context) => const GuysPage(),
          '/expenses/add': (context) => const AddExpensePage(),
        },
      ),
    );
  }
}
