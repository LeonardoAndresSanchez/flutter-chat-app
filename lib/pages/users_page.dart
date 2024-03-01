import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_app/models/users.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final users = [
    User(uid: '1', name: 'Laura', email: 'Laura@test.com', online: false),
    User(uid: '2', name: 'Isabella', email: 'isa@test.com', online: true),
    User(uid: '3', name: 'Mishell', email: 'Mishel@test.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi nombre',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.logout_rounded),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check_circle_rounded,
              color: Colors.green[400],
            ),
            // child: Icon(
            //   Icons.check_circle_bolt,
            //   color: Colors.red,
            // ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _loadUser,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(
            Icons.check,
            color: Colors.green[600],
          ),
        ),
        child: _listViewUsers(),
      ),
    );
  }

  ListView _listViewUsers() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, i) => _userListTile(users[i]),
      separatorBuilder: (_, i) => const SizedBox(height: 5),
      itemCount: users.length,
    );
  }

  ListTile _userListTile(User user) {
    return ListTile(
      title: Text(user.name!),
      subtitle: Text(user.email!),
      leading: CircleAvatar(
        child: Text(
          user.name!.substring(0, 2),
        ),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: user.online! ? Colors.green[300] : Colors.red[700],
        ),
      ),
    );
  }

  _loadUser() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
