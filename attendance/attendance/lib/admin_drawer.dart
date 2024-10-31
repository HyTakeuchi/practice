import 'package:flutter/material.dart';
import 'admin_add.dart';
import 'admin_qr.dart';
import 'admin_main.dart';

class AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('機能一覧'),
          ),
          ListTile(
            title: const Text('QRコード'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AdminQr()),
              );
            },
          ),
          ListTile(
            title: const Text('従業員一覧'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AdminMain()),
              );
            },
          ),
          ListTile(
            title: const Text('従業員追加'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AdminAdd()),
              );
            },
          ),
          ListTile(
            title: const Text('ログアウト'),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
