import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage1 extends StatefulWidget {
  @override
  _TestPage1State createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1>{
  final TextEditingController document = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController publisher = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController page = TextEditingController();
  String? _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("追加と更新"),
        ),
        body: Center(
            child: ListView(
            children: [
              Text("書籍情報入力", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
              // テキストボックス
              TextField(                
                controller: document,
                decoration: InputDecoration(
                  icon: Icon(Icons.info),
                  labelText: 'ドキュメント名'
                ),
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  icon: Icon(Icons.library_books),
                  labelText: '書名'
                ),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  icon: Icon(Icons.face),
                  labelText: '著名者'
                ),
              ),
              TextField(
                controller: publisher,
                decoration: InputDecoration(
                  icon: Icon(Icons.publish),
                  labelText: '出版社'
                ),
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(
                  icon: Icon(Icons.price_check),
                  labelText: '価格(円)'
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: page,
                decoration: InputDecoration(
                  icon: Icon(Icons.numbers),
                  labelText: 'ページ数'
                ),
                keyboardType: TextInputType.number,
              ),
              // ラジオボタン
              RadioListTile<String>(
                title: Text('情報'),
                value: '情報',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('国文学'),
                value: '国文学',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('海外文学'),
                value: '海外文学',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('自然科学'),
                value: '自然科学',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('人文科学'),
                value: '人文科学',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('哲学'),
                value: '哲学',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    int parsedPrice = int.parse(price.text);
                    int parsedPage = int.parse(page.text);

                    await FirebaseFirestore.instance.collection('book')
                    .doc(document.text)
                    .set({
                      'title': title.text,
                      'name': name.text,
                      'publisher': publisher.text,
                      'price': parsedPrice,
                      'page': parsedPage,
                      'calc': _selectedOption,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('書籍情報が正常に追加されました')),
                    );

                    // 値をクリア
                    document.clear();
                    title.clear();
                    name.clear();
                    publisher.clear();
                    price.clear();
                    page.clear();
                    setState(() {
                      _selectedOption = '';
                    });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('エラーが発生しました: $e')),
                      );
                    }
                },
                child: Text('書籍情報追加'),
              ),
            ],
          ),
        )
    );
  }
}