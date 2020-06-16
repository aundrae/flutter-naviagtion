import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WebView extends StatefulWidget {
  String url;

  WebView({Key key, @required this.url}) : super(key: key);

  @override
  _WebView createState() => _WebView();
}

class _WebView extends State<WebView> {
  //Initialize the app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web View"),
      ),
      body: Center(
        child: new Image.network(//used to render images from online
          widget.url,
        ),
      ),
    );
  }
}
