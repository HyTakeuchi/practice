import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('ja_JP').then(
    (_) {
      runApp(
        const MyApp(),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("calendar"),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                final result = await showDialog<String>(
                  context: context,
                  builder: (context) {
                    final TextEditingController titleController = TextEditingController();
                    final TextEditingController infoController = TextEditingController();
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(labelText: 'タイトル'),
                          ),
                          TextField(
                            controller: infoController,
                            decoration: InputDecoration(labelText: '詳細'),
                          )
                        ]
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('キャンセル'),
                        ),
                        TextButton(
                          onPressed: () async {
                            // 追加ボタン
                            await FirebaseFirestore.instance.collection('calendar').add({
                              'date': Timestamp.fromDate(_selectedDay!),
                              'title': titleController.text,
                              'info': infoController.text,
                            });
                            if (mounted) {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('OK'),
                        )
                      ],
                    );
                  },
                );
              } catch (e) {
                print("error: $e");
              }
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            locale: 'ja_JP',
            selectedDayPredicate: (day) =>
              isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              setState(() {});
            },
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('calendar').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // calendarコレクションのデータを取得
                final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
                // 選択された日付と一致するドキュメントだけをフィルタリング
                final List<QueryDocumentSnapshot> filteredDocuments = documents.where((doc) {
                  final date = (doc['date'] as Timestamp).toDate();
                  return isSameDay(_selectedDay, date);
                }).toList();

                // calendarコレクションのデータを日付順にする
                filteredDocuments.sort((a, b) => a['date'].compareTo(b['date']));

                return Expanded(
                  child: ListView.builder(
                    itemCount: filteredDocuments.length,
                    itemBuilder: (context, index) {
                      // コレクションのデータを取得
                      final document = filteredDocuments[index];
                      // データをDateTime型に変換
                      final date = (document['date'] as Timestamp).toDate();
                      if (document['date'] != null) {
                        return ListTile(
                          trailing: IconButton(
                            // 削除ボタン
                            onPressed: () async {
                              await FirebaseFirestore.instance.collection('calendar').doc(document.id).delete();
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          // データを表示
                          title: Text(document['title']),
                          subtitle: Text(document['info']),
                        );
                      } else {
                        return ListTile(
                          title: const Text("予定がありません。"),
                        );
                      }
                    },
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }
          )
        ],
      ),
    );
  }
}