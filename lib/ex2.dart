import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  int _counter = 10;

  // 再生
  _forward() async {
    setState(() {
      _animationController.forward();
    });
  }

  // 生成
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3)); 
    _animation = _animationController.drive(Tween(begin: 0.0, end: 10.0 * pi));
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        _counter--;
        setState(() {
          
        });
      }
    );
  }
  
  // 破棄
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Container(
              child: Text(_counter.toString()),
              // child: Column(
                // children: [
                // ],
              // ),
            );
          }
        )
      ),
      // 再生、停止、逆再生ボタン
      floatingActionButton:
        FloatingActionButton(onPressed: _forward, child: const Text("スタート")),
    );
  }
}
