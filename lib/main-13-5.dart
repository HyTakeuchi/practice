import 'package:flutter/material.dart';

class TestPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("七戸十和田駅"),
        ),
        body: Center(
            child: Container(
              child: Image.asset('images/towada.jpg'),
            )
        )
    );
  }
}
