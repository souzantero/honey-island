import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Honey Island'),
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
              title: const Text("Guys"),
              onTap: () {
                Navigator.pushNamed(context, '/guys');
              },
            )
          ],
        ),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}