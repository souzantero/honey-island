import 'package:flutter/material.dart';
import 'package:honey_island/users/user_list.dart';
import 'package:provider/src/provider.dart';

class UserPage extends StatelessWidget {

  const UserPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final userList = context.watch<UserList>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: userList.users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(userList.users[index].name),
            );
          }
        )
      ),
    );
  }
}