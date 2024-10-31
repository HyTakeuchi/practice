import 'package:flutter/material.dart';

class GoTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("トップページ"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("出勤qr")
              ],
            )
        )
    );
  }
}
