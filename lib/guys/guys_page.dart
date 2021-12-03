import 'package:flutter/material.dart';
import 'package:honey_island/guys/guys_list.dart';
import 'package:provider/src/provider.dart';

class GuysPage extends StatelessWidget {

  const GuysPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final guysList = context.watch<GuysList>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guys'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: guysList.guys.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(guysList.guys[index].name),
            );
          }
        )
      ),
    );
  }
}