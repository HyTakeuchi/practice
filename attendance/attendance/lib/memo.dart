import 'package:flutter/material.dart';
import 'admin_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAdd extends StatelessWidget {
  final TextEditingController userNoController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  final CollectionReference users = FirebaseFirestore.instance.collection('attendance');

  Future<void> register() async {
    String userNo = userNoController.text;
    String userName = userNameController.text;
    String userPassword = userPasswordController.text;

    if (userNo.isNotEmpty && userName.isNotEmpty && userPassword.isNotEmpty) {
      try {
        await users.add({
          'user_no': userNo,
          'user_name': userName,
          'user_password': userPassword,
        });
        print("新規登録に成功しました");
      } catch (error) {
        print("新規登録に失敗しました: $error");
      }
    } else {
      print("全てのフィールドを入力してください。");
    }
  }

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
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            TextField(
              controller: userNoController,
              decoration: const InputDecoration(labelText: '社員番号'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(labelText: '従業員名'),
            ),
            TextField(
              controller: userPasswordController,
              decoration: const InputDecoration(labelText: 'パスワード'),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                await register();
              },
              child: const Text("ユーザー登録"),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
