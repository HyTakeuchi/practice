import 'package:flutter/material.dart';

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
  String str = '';
  int strColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const[
          Icon(Icons.create),
          Text("問題2"),
        ]),
      ),
      body: Column(children: [
        const Text("HelloWorld"),
        const Text("ハローワールド"),
        TextButton(
          onPressed: () {
            setState(() {
              str = 'テキストボタンクリック！！';
            });
          },
          child: const Text("テキストボタン"),
        ),
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.pink, size: 24.0,),
                  onPressed: () {
                    setState(() {
                      str = 'favoriteクリック！！';
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.audiotrack, color: Colors.green, size: 30.0,),
                  onPressed: () {
                    setState(() {
                      str = 'audiotrackボタンクリック！！';
                      strColor = ;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.beach_access, color: Colors.blue, size: 36.0,),
                  onPressed: () {
                    setState(() {
                      str = 'beach_accessボタンクリック！！';
                    });
                  },
                ),
              ]),
            Center(
              child: Text(
                str,
                style: const TextStyle(fontSize: 30, Color()),
              )
            ),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {print("押したね？")}, child: const Icon(Icons.timer)),
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("EndDrawer"))),
    );
  }
}