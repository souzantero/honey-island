import 'package:flutter/material.dart';
import 'package:honey_island/app.dart';
import 'package:honey_island/events/repositories/event_store.dart';
import 'package:honey_island/expenses/repositories/expense_store.dart';
import 'package:honey_island/users/user_store.dart';

void main() {
  runApp(const App(
    userRepository: UserStore(),
    eventRepository: EventStore(),
    expenseRepository: ExpenseStore(),
  ));
}
