import 'package:flutter/material.dart';

class TestPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("仙台駅"),
        ),
        body: Center(
            child: Container(
              child: Image.asset('images/sendai.jpg'),
            )
        )
    );
  }
}
