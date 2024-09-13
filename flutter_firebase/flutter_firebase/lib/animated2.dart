import 'package:flutter/material.dart';

void main() {
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
  bool _flag = false;

  // ボタンタップ時にフラグを切り替える
  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
                duration: const Duration(seconds: 3),
                width: _flag ? 100 : 50,
                height: _flag ? 50 : 100,
                padding:
                    _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
                margin:
                    _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
                transform: _flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
                color: _flag ? Colors.blue : Colors.grey),
            AnimatedSwitcher(
                duration: const Duration(seconds: 3),
                child: _flag
                    ? const Text("なにもない")
                    : const Icon(Icons.favorite, color: Colors.pink))
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: _click, child: const Icon(Icons.add)),
    );
  }
}
