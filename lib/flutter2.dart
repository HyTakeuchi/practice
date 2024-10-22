import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage2 extends StatefulWidget {
  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  List<Map<String, dynamic>> items = [];  

  // Firestoreからデータを取得するメソッド
  Future<void> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('book').get();
      final List<Map<String, dynamic>> fetchedItems = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      setState(() {
        // データをリストにセット
        items = fetchedItems;  
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
        body: Column(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: fetchData,
                    child: Text('書籍一覧', style: TextStyle(fontSize: 40, color: Colors.blue)),
                  ),
                ),
                Expanded(
                child: items.isEmpty
                    ? Center(child: Text(''))
                    : ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("ドキュメント名: ${items[index]['document']}|書名: ${items[index]['title']}|著者名: ${items[index]['name']}|出版社: ${items[index]['publisher']}|価格: ${items[index]['price']}円|ページ数: ${items[index]['page']}ページ|分野: ${items[index]['calc']}", 
                            style: TextStyle(color: Colors.blue),),
                          );
                        },
                      ),
                ),
            ],
        )
    );
  }
}