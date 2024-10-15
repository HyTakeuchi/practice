import 'package:flutter/material.dart';

class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("福島駅"),
        ),
        body: Center(
            child: Container(
              child: Image.asset('images/fukushima.jpg'),
            )
        )
    );
  }
}
