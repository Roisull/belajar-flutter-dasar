import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

class Heading extends StatelessWidget {

  final String text;
  const Heading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BiggerText extends StatefulWidget {

  final String text;

  const BiggerText({super.key, required this.text});

  @override
  State<BiggerText> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {

  double _textSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          style: TextStyle(
            fontSize: _textSize
          ),
        ),
        ElevatedButton(
          child: const Text("Perbesar"),

          onPressed: (){
            setState(() {
              _textSize = 32.0;
            });
          },
        ),
        ElevatedButton(
          child: const Text("Perkecil"),

          onPressed: (){
            setState(() {
              _textSize = 16.0;
            });
          },
        )
      ],
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        actions: <Widget>[
          IconButton(
            onPressed: (){}, 
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: (){},
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            // width: 200,
            // height: 100,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: const Text(
              'Hi',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}
