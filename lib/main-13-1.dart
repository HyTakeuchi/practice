import 'package:flutter/material.dart';

class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("東京駅"),
        ),
        body: Center(
            child: Container(
                child: Image.asset('images/tokyo.jpg'),
            )
        )
    );
  }
}