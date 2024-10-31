import 'package:flutter/material.dart';
import 'go_time.dart';
import 'left_time.dart';

class UserMain extends StatelessWidget {
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
                ElevatedButton(
                child: const Text('出勤'),
                onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return GoTime();
                    }));
                }),
                ElevatedButton(
                child: const Text('退勤'),
                onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return LeftTime();
                    }));
                }),
              ],
            )
        )
    );
  }
}
