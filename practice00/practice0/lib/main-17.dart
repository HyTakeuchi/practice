import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController document = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController from = TextEditingController();
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
                controller: name,
                decoration: InputDecoration(
                  icon: Icon(Icons.info),
                  labelText: 'ドキュメント名'
                ),
              ),
              TextField(
                controller: age,
                decoration: InputDecoration(
                  icon: Icon(Icons.library_books),
                  labelText: '書名'
                ),
              ),
              TextField(
                controller: from,
                decoration: InputDecoration(
                  icon: Icon(Icons.face),
                  labelText: '著名者'
                ),
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
                    int ageInt = int.parse(age.text);

                    await FirebaseFirestore.instance.collection('exCollection17')
                    .doc(document.text)
                    .set({
                      'name': name.text,
                      'from': from.text,
                      'page': ageInt,
                      'a': _selectedOption,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('書籍情報が正常に追加されました')),
                    );

                    // 値をクリア
                    name.clear();
                    age.clear();
                    from.clear();
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