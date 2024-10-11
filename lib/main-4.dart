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
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const[
          Icon(Icons.create),
          Text("問題4"),
        ]),
      ),
      body: Column(children: [
        const Text("HelloWorld"),
        const Text("ハローワールド"),
        TextButton(
          onPressed: () {
            setState(() {
              str = 'テキストボタンクリック！！';
              textColor = Colors.brown;
            });
          },
          child: const Text("テキストボタン", style: TextStyle(fontSize: 30)),
        ),
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.pink, size: 24.0,),
                  onPressed: () {
                    setState(() {
                      str = 'favoriteクリック！！';
                      textColor = Colors.pink;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.audiotrack, color: Colors.green, size: 30.0,),
                  onPressed: () {
                    setState(() {
                      str = 'audiotrackボタンクリック！！';
                      textColor = Colors.green;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.beach_access, color: Colors.blue, size: 36.0,),
                  onPressed: () {
                    setState(() {
                      str = 'beach_accessボタンクリック！！';
                      textColor = Colors.blue;
                    });
                  },
                ),
              ]),
            Center(
              child: Text(
                str,
                style: TextStyle(fontSize: 30, color: textColor),
              )
            ),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              str = "FloatingActionButtonクリック！！";
              textColor = Colors.purple;
            });
          },
          child: const Icon(Icons.timer)),
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("EndDrawer"))),
    );
  }
}