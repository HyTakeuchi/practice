import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage3 extends StatefulWidget {
  @override
  _TestPage3State createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
  TextEditingController searchController = TextEditingController(); 
  String? _selectedOption = '';
  QuerySnapshot? _searchResult; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("条件検索表示"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "検索のタイプを選択",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          // ラジオボタン
          RadioListTile<String>(
            title: Text('書名'),
            value: 'title',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('著者名'),
            value: 'name',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('出版社'),
            value: 'publisher',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('価格'),
            value: 'price',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('ページ数'),
            value: 'page',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('分野'),
            value: 'calc',
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
                icon: Icon(Icons.search), labelText: '検索語'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (searchController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('検索語を入力してください。')),
                );
                return;
              }

              try {
                String select = _selectedOption!;
                Query query = FirebaseFirestore.instance.collection('book');

                if (select == 'price' || select == 'page') {
                  int intText = int.parse(searchController.text);
                  query = query.where(select, isEqualTo: intText);
                } else {
                  query = query.where(select, isEqualTo: searchController.text);
                }

                QuerySnapshot searchResult = await query.get();
                setState(() {
                  _searchResult = searchResult;
                });

                searchController.clear();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('エラーが発生しました: $e')),
                );
              }
            },
            child: Text('条件取得実行'),
          ),
          // 検索結果を表示する
          Expanded(
            child: _searchResult != null
                ? ListView(
                    children: _searchResult!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text(
                          "ドキュメントID: ${document.id} | "
                          "書名: ${data['title']} | "
                          "著者名: ${data['name']} | "
                          "出版社: ${data['publisher']} | "
                          "価格: ${data['price']}円 | "
                          "ページ数: ${data['page']}ページ | "
                          "分野: ${data['calc']}",
                        ),
                      );
                    }).toList(),
                  )
                : Center(child: Text('')),
          )
        ],
      ),
    );
  }
}
