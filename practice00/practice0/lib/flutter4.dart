import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage4 extends StatefulWidget {
  @override
  _TestPage4State createState() => _TestPage4State();
}

class _TestPage4State extends State<TestPage4> {
  final TextEditingController document2 = TextEditingController();
  List<Map<String, dynamic>> items = [];  
  bool showList = false;  

  // Firestoreからデータを取得するメソッド
  Future<void> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('book').get();
      final List<Map<String, dynamic>> fetchedItems = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['documentId'] = doc.id;
        return data;
      }).toList();
      setState(() {
        items = fetchedItems;
        showList = true;  // 一覧を表示
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("一覧表示"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // テキストボックス
            TextField(
              controller: document2,
              decoration: InputDecoration(
                icon: Icon(Icons.info),
                labelText: 'ドキュメント名',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  // ドキュメント削除
                  await FirebaseFirestore.instance
                      .collection('book')
                      .doc(document2.text)
                      .delete();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('削除完了')),
                  );

                  // 値をクリア
                  document2.clear();

                  // 最新のデータを取得して一覧を表示
                  await fetchData();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('エラーが発生しました: $e')),
                  );
                }
              },
              child: Text('削除'),
            ),
            SizedBox(height: 20),
            if (showList)  // 削除後に一覧を表示
              Column(
                children: [
                  Text(
                    "削除後の情報一覧",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  items.isEmpty
                      ? Center(child: Text('データがありません'))
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                "ドキュメント名: ${items[index]['documentId']} | "
                                "書名: ${items[index]['title']} | "
                                "著者名: ${items[index]['name']} | "
                                "出版社: ${items[index]['publisher']} | "
                                "価格: ${items[index]['price']}円 | "
                                "ページ数: ${items[index]['page']}ページ | "
                                "分野: ${items[index]['calc']}",
                              ),
                            );
                          },
                        ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
