import 'package:flutter/material.dart';
import 'main-12-2.dart';

// 状態を持たないウィジェット（StatelessWidget）
class Main12_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test1"),
        ),
        body: Center(
            child: TextButton(
                onPressed: () => {
                      // Navigatorを使って新しいページ（TestPage2）に遷移
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        // TestPage2のウィジェットを表示
                        return Main12_2();
                      }))
                    },
                    child: const Text("次駅", style: TextStyle(fontSize: 30)),
            )
        )
    );
  }
}
