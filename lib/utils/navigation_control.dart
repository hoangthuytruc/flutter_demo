import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewNavigationControl extends StatelessWidget {
  const WebviewNavigationControl({required this.controller, super.key});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () {
            controller.reload();
          },
        ),
      ],
    );
  }
}