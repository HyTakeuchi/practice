import 'package:flutter/material.dart';
import 'main-13-1.dart';
import 'main-13-2.dart';
import 'main-13-3.dart';
import 'main-13-4.dart';
import 'main-13-5.dart';
import 'main-13-6.dart';

void main() {
  runApp(const MyApp());
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
  // ページの切り替えを制御するためのPageControllerを定義
  late PageController _pageController;
  // 現在選択されているページのインデックスを保持
  int _selectedIndex = 0;

  // ページの配列
  final _pages = [
    TestPage1(), // Index0
    TestPage2(),
    TestPage3(),
    TestPage4(),
    TestPage5(),
    TestPage6(),
  ];

  // 生成
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  // 破棄
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  // ページ変更時に呼び出すメソッド
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 複数のページをスワイプして切り替え
        body: PageView(
            // PageControllerを使ってページを制御
            controller: _pageController,
            // ページが変わったときに_onPageChangedを呼び出す
            onPageChanged: _onPageChanged,
            children: _pages));
  }
}
