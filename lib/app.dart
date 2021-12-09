
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:honey_island/events/models/event_list.dart';
import 'package:honey_island/events/repositories/event_repository.dart';
import 'package:honey_island/expenses/pages/add_expense_page.dart';
import 'package:honey_island/expenses/pages/expense_analysis_page.dart';
import 'package:honey_island/expenses/models/expense_list.dart';
import 'package:honey_island/expenses/pages/expense_page.dart';
import 'package:honey_island/expenses/repositories/expense_repository.dart';
import 'package:honey_island/home/home_page.dart';
import 'package:honey_island/users/user_list.dart';
import 'package:honey_island/users/user_page.dart';
import 'package:honey_island/users/user_repository.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;
  final EventRepository eventRepository;
  final ExpenseRepository expenseRepository;

  const App({
    Key? key, 
    required this.userRepository,
    required this.eventRepository,
    required this.expenseRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserList>(
          create: (_) => UserList(repository: userRepository),
        ),
        ChangeNotifierProvider<EventList>(
          create: (_) => EventList(repository: eventRepository),
        ),
        ChangeNotifierProxyProvider<UserList, ExpenseList>(
          create: (_) => ExpenseList(repository: expenseRepository),
          update: (_, userList, expenseList) {
            if (expenseList == null) throw ArgumentError.notNull('expenseList');
            expenseList.update(userList: userList);
            return expenseList;
          }
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
          '/expenses': (context) => const ExpensePage(),
          '/expenses/add': (context) => const AddExpensePage(),
          '/expenses/analysis': (context) => const ExpenseAnalysisPage(),
        },
      ),
    );
  }
}
