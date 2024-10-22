import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage4 extends StatefulWidget {
  @override
  _TestPage4State createState() => _TestPage4State();
}


class _TestPage4State extends State<TestPage4> {
  final TextEditingController document2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("一覧表示"),
        ),
        body: Center(
            child: ListView(
              children: [
                // テキストボックス
                TextField(                
                  controller: document2,
                  decoration: InputDecoration(
                    icon: Icon(Icons.info),
                    labelText: 'ドキュメント名'
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseFirestore.instance.collection('book')
                      .where('document', isEqualTo: document2.text)
                      .get()
                      .then(
                        (QuerySnapshot snapshot) => {
                          snapshot.docs.forEach((d) {
                            FirebaseFirestore.instance.collection('book')
                            .doc(d.reference.id)
                            .delete(); 
                          })
                        }
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('削除完了')),
                      );

                      // 値をクリア
                      document2.clear();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('エラーが発生しました: $e')),
                        );
                      }
                  },
                  child: Text('削除'),
                ),
                Text("削除後の情報一覧", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
              ],
            ),
        )
    );
  }
}