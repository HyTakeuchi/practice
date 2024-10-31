import 'package:flutter/material.dart';

class Main21_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextButton(onPressed: () => {Navigator.of(context).pop()}, child: const Text("トップページ")),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Welcome!!", style: TextStyle(fontSize: 80, color: Colors.blue)),
                Image.asset('images/aomori.jpg'),
              ],
            )
        )
    );
  }
}
