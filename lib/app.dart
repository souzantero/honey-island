
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:honey_island/guys/guys_list.dart';
import 'package:honey_island/guys/guys_page.dart';
import 'package:honey_island/guys/guys_repository.dart';
import 'package:honey_island/home/home_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final GuysRepository guysRepository;

  const App({Key? key, required this.guysRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GuysList(repository: guysRepository),
      child: MaterialApp(
        title: 'Honey Island',
        theme: ThemeData.dark(),
        initialRoute: '',
        routes: {
          '/': (context) => const HomePage(),
          '/guys': (context) => const GuysPage(),
        },
      ),
    );
  }
}
