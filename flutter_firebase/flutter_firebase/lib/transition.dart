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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  // 再生
  _forward() async {
    setState(() {
      _animationController.forward();
    });
  }

  //停止
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
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizeTransition(
              sizeFactor: _animationController, // AnimationControllerを設定
              child: Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(color: Colors.green))),
            ),
          ],
        ),
      ),
      // 再生、停止、逆再生のボタン
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
            onPressed: _forward, child: const Icon(Icons.arrow_forward)),
        FloatingActionButton(onPressed: _stop, child: const Icon(Icons.pause)),
        FloatingActionButton(
            onPressed: _reverse, child: const Icon(Icons.arrow_back)),
      ]),
    );
  }
}
