import 'package:flutter/material.dart';
import 'topContainer.dart';
import 'midContainer.dart';
import 'botContainer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(MyApp());
  /*runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );*/
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KeySMR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'BitPap',
      ),
      //locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  // redmi note 8:
  // width: 450
  // height: 975

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xFF7A1818), // old color Colors.amber
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              topContainer(),
              Expanded(child: midContainer()),
              botContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
