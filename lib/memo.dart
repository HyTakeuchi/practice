import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TestPage3 extends StatefulWidget {
  @override
  _TestPage3State createState() => _TestPage3State();
}


class _TestPage3State extends State<TestPage3> {
  TextEditingController searchController = TextEditingController(); // 入力管理用のコントローラー
  String? _selectedOption = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("条件検索表示"),
        ),
        body: Column(
          children: [
            Center(
              child: Text("書籍情報入力", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
            ),
            // ラジオボタン
            RadioListTile<String>(
              title: Text('書名'),
              value: '書名',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('著者名'),
              value: '著者名',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('出版社'),
              value: '出版社',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('価格'),
              value: '価格',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('ページ数'),
              value: 'ページ数',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('分野'),
              value: '分野',
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            TextField(                
                controller: searchController,
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: '検索語'
                ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (searchController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('検索語を入力してください。')),
                    );
                    return;
                  }

                  String select = _selectedOption!;

                  if (select == '価格' || select == 'ページ数') {
                    try {
                      int intText = int.parse(searchController.text);
                      Query query = FirebaseFirestore.instance
                        .collection('book')
                        .where(select, isEqualTo: intText);

                      StreamBuilder<QuerySnapshot>(
                        stream: query.snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          // 検索結果の表示
                          return ListView(
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                              return ListTile(
                                title: Text("ドキュメント名: ${data['document']}|書名: ${data['title']}|著者名: ${data['name']}|出版社: ${data['publisher']}|価格: ${data['price']}円|ページ数: ${data['page']}ページ|分野: ${data['calc']}",));
                            }).toList()
                          );
                        },
                      );

                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('価格またはページ数は整数でなければなりません。')),
                      );
                      return;
                    }
                  } else {
                    await FirebaseFirestore.instance
                        .collection('book')
                        .where(select, isEqualTo: searchController)
                        .get();
                  }

                  searchController.clear();
                  setState(() {
                    _selectedOption = '';
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('エラーが発生しました: $e')),
                  );
                }
              },
              child: Text('条件取得実行'),
            )
          ]
        ),
    );
  }
}