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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
            AnimatedOpacity(
                opacity: _flag ? 0.1 : 1.0,
                duration: const Duration(seconds: 3),
                child: Text(
                  "福岡情報校",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 40,
                    color: Colors.blue,
                  ),
                  // style: Theme.of(context).textTheme.headlineMedium,
                )),
            AnimatedAlign(
                duration: const Duration(seconds: 3),
                alignment: _flag ? Alignment.topLeft : Alignment.bottomRight,
                child: Image.asset('images/o-hara.png'),),
            // AnimatedContainer(
            //   duration: const Duration(seconds: 3),
            //   width: _flag ? 100 : 50,
            //   height: _flag ? 50 : 100,
            //   padding: _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
            //   margin: _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
            //   transform: _flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
            //   color: _flag ? Colors.blue : Colors.grey),
            // AnimatedSwitcher(
            //   duration: const Duration(seconds: 3),
            //   child: _flag
            //       ? const Text("なにもない")
            //       : const Icon(Icons.favorite, color: Colors.pink))
          ],
        ),
      ),
      floatingActionButton:
        FloatingActionButton(onPressed: _click, child: const Icon(Icons.add)),
    );
  }
}
