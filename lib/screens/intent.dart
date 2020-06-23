import 'package:flutter/material.dart';
import 'package:newapp/screens/webview.dart';
import 'package:http/http.dart' as http; //third party library used to access data from online
import 'dart:convert';
import 'package:animations/animations.dart';

// ignore: must_be_immutable
class IntentScreen extends StatefulWidget {
  String text;

  IntentScreen({Key key, @required this.text}) : super(key: key);

  @override
  _Screen1 createState() => _Screen1();
}

class _Screen1 extends State<IntentScreen> {
  //URL used for the get request
  final String url = "https://jsonplaceholder.typicode.com/albums/1/photos";
  List _data; //stores the data from the server
  bool _fetchComplete = false; //used to show and hide loading animation

  //Initialize the app
  void initState() {
    super.initState();
    //Calls the method hear so that when this screen is initialized it will auto pull the data from the server.
    getData();
  }

  //Get request from server
  getData() async {
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      //setState is used so that the screen will auto update when the data is parsed;
      setState(() {
        _data = json.decode(response.body);
        _fetchComplete = true;
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // Renders list of items from _data variable
  Widget _buildList() {
    return (Center(
        //ListView.builder auto generates using the _data information
        //which includes the actual data and the length of the array.
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: _data == null ? 0 : _data.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: InkWell(
          //This allows the entire Card widget to be clicked
          // it uses the onTap to do the functionality set and will show feedback when it is clicked
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebView(url: _data[index]["url"]),
                ));
          },
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Image.network(
              _data[index]['thumbnailUrl'].toString(),
              fit: BoxFit.fill,
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: Text(_data[index]["title"].toString().toUpperCase()), //this is how to access a json object fromm an array of objects
            ),
          ]),
        ));
      },
    )));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.text),
        ),
        body: _fetchComplete // if false will show loading animation, else will display the returned list
            ? _buildList()
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
