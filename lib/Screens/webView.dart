import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatefulWidget {
  final url;
  Web(this.url);

  @override
  _WebState createState() => _WebState();
}

class _WebState extends State<Web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
