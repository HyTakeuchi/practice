import 'package:flutter/material.dart';
import 'admin_drawer.dart';

class AdminQr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextButton(onPressed: () => {Navigator.of(context).pop()}, child: const Text("トップページ")),
        ),
        drawer: AdminDrawer(),
        body: Center(
            child: Column(
              children: <Widget>[
                Text("QR")
              ],
            )
        )
    );
  }
}
