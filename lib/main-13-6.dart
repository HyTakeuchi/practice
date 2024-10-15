import 'package:flutter/material.dart';

class TestPage6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("新青森駅"),
        ),
        body: Center(
            child: Container(
              child: Image.asset('images/aomori.jpg'),
            )
        )
    );
  }
}
