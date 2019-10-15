import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


Tpa tpaFromJson(String str) => Tpa.fromJson(json.decode(str));

String tpaToJson(Tpa data) => json.encode(data.toJson());

class Tpa {
    bool status;
    List<Map<String, String>> data;

    Tpa({
        this.status,
        this.data,
    });

    factory Tpa.fromJson(Map<String, dynamic> json) => new Tpa(
        status: json["status"],
        data: new List<Map<String, String>>.from(json["data"].map((x) => new Map.from(x).map((k, v) => new MapEntry<String, String>(k, v == null ? null : v)))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": new List<dynamic>.from(data.map((x) => new Map.from(x).map((k, v) => new MapEntry<String, dynamic>(k, v == null ? null : v)))),
    };
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
