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

  // 再生
  _forward() async {
    setState(() {
      _animationController.forward();
    });
  }

  // 停止
  _stop() async {
    setState(() {
      _animationController.stop();
    });
  }

  // 逆再生
  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  // 生成
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3)); 
    _animation = _animationController.drive(Tween(begin: 0.0, end: 10.0 * pi));
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
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Container(
              child: Column(
                children: [
                  Transform.rotate(
                    angle: _animation.value,
                    child: Image.asset('images/miyagi.jpg', width: 200, height: 200,), 
                  ),
                  Transform.rotate(
                    angle: -_animation.value,
                    child: Text('宮城県誕生150周年', style: TextStyle(color: Colors.green, fontSize: 40),), 
                  ),
                ],
              ),
            );
          }
        )
      ),
      // 再生、停止、逆再生ボタン
      floatingActionButton:
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FloatingActionButton(onPressed: _forward, child: const Icon(Icons.arrow_forward)),
          FloatingActionButton(onPressed: _stop, child: const Icon(Icons.pause)),
          FloatingActionButton(onPressed: _reverse, child: const Icon(Icons.arrow_back)),
        ]),
    );
  }
}
