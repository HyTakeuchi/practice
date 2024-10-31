import 'package:flutter/material.dart';

class TestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("宇都宮駅"),
        ),
        body: Center(
            child: Container(
              child: Image.asset('images/utsu.jpg'),
            )
        )
    );
  }
}
