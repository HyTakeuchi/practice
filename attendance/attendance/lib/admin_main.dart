import 'package:attendance/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'admin_edit.dart';
import 'admin_add.dart';

class AdminMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("トップページ"),
        ),
      ),
      drawer: AdminDrawer(),
      body: Center(
        child: ListView(
          children: <Widget>[
            ElevatedButton(
              child: const Text('従業員追加'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AdminAdd()),
                );
              },
            ),
            ListTile(
              title: const Text('従業員1'),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminEdit()),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: const Text('従業員2'),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminEdit()),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: const Text('従業員3'),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminEdit()),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
