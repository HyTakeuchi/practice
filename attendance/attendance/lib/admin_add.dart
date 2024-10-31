import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'admin_drawer.dart';

class AdminAdd extends StatefulWidget {
  @override
  _AdminAddState createState() => _AdminAddState();
}

class _AdminAddState extends State<AdminAdd>{
  final TextEditingController user_no = TextEditingController();
  final TextEditingController user_name = TextEditingController();
  final TextEditingController user_password= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("従業員追加"),
        ),
        drawer: AdminDrawer(),
        body: Center(
            child: ListView(
            children: [
              Text("従業員情報入力", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
              // テキストボックス
              TextField(                
                controller: user_no,
                decoration: InputDecoration(
                  labelText: '社員番号'
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: user_name,
                decoration: InputDecoration(
                  labelText: '従業員名'
                ),
              ),
              TextField(
                controller: user_password,
                decoration: InputDecoration(
                  labelText: 'パスワード'
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    int user_number = int.parse(user_no.text);

                    await FirebaseFirestore.instance.collection('attendance')
                    .doc(user_no.text)
                    .set({
                      'user_no': user_number,
                      'user_name': user_name.text,
                      'user_password': user_password.text,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('従業員情報が正常に追加されました')),
                    );

                    // 値をクリア
                    user_no.clear();
                    user_name.clear();
                    user_password.clear();
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('エラーが発生しました: $e')),
                      );
                    }
                },
                child: Text('従業員情報追加'),
              ),
            ],
          ),
        )
    );
  }
}