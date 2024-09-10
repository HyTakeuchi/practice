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
  late Animation<double> _animationDouble;
  late Animation<double> _animationDouble2;
  final Tween<double> _tweenDouble = Tween(begin: 0.0, end: 200.0);
  late Animation<Color?> _animationColor; 
  final ColorTween _tweenColor = ColorTween(begin: Colors.green, end: Colors.blue);
  final Duration animDuration = const Duration(milliseconds: 2000);

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

  // // 生成
  // @override
  // void initState() {
  //   super.initState();
  //   // _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

  //   _animationController = AnimationController(value: 0.0, vsync: this, duration: animDuration,);

    // TweenとAnimationControllerからAnimationを作る(サイズ)
    // _animationDouble = _tweenDouble.animate(_animationController);
    // _animationDouble.addListener(() {
    //   setState(() {});
    // });
  //   // TweenとAnimationControllerからAnimationを作る(色)
  //   _animationColor = _tweenColor.animate(_animationController);
  //   _animationColor.addListener(() {
  //     setState(() {});
  //   });
  // }

    @override
    void initState() {
      super.initState();
      _animationController =
          AnimationController(duration: const Duration(seconds: 2), vsync: this);
      _animationDouble = Tween<double>(begin: 0, end: 150).animate(_animationController)
        ..addListener(() {
          setState(() {
            // The state that has changed here is the animation object’s value.
          });
        });
        _animationDouble2 = Tween<double>(begin: 0, end: 550).animate(_animationController)
        ..addListener(() {
          setState(() {
            // The state that has changed here is the animation object’s value.
          });
        });
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
        // child: Column(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizeTransition(
              sizeFactor: _animationController,
              child: Center(
                child: Text("東京情報校", style: TextStyle(fontSize: _animationDouble.value, color: Colors.blue, fontStyle: FontStyle.italic),), 
              ),
            ),
            SizeTransition(
              sizeFactor: _animationController,
              child: Center(
                child: Container(
                width: _animationDouble2.value,
                height: _animationDouble2.value,
                // child: const FlutterLogo())),
                child: Image.asset('images/o-hara3.png', fit: BoxFit.contain,))),
              ),
          ],
        ),
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
