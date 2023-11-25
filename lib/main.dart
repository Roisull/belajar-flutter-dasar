import 'package:flutter/material.dart';
import 'package:flutter_dasar_id_camp/second_screen.dart';

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
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'RobotoMono',
            fontStyle: FontStyle.italic,
          ),
        ),
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
          style: TextStyle(fontSize: _textSize),
        ),
        ElevatedButton(
          child: const Text("Perbesar"),
          onPressed: () {
            setState(() {
              _textSize = 32.0;
            });
          },
        ),
        ElevatedButton(
          child: const Text("Perkecil"),
          onPressed: () {
            setState(() {
              _textSize = 16.0;
            });
          },
        )
      ],
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? language;
  String _name = '';
  bool lightOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(3, 6),
                  blurRadius: 10,
                ),
              ],
            ),
            // width: 200,
            // height: 100,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            child: const Text(
              'Hi',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              'coba menambah coloumn',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0),
            child: const Text(
              'coba menambah coloumn',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                // disini tempat untuk menuliskan aksi ketika button di pencet
              },
              child: const Text('Text Button')),
          Center(
            child: Container(
              margin: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: OutlinedButton(
                  onPressed: () {
                    // disini tempat untuk menuliskan aksi ketika button di pencet
                    // navigate ke second screen
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                const SecondScreen(),
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOutCubic;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            }));
                  },
                  child: const Text('Go to Second Screen')),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              // disini tempat untuk menuliskan aksi ketika button di pencet
            },
            tooltip: 'Increase volume by 10',
          ),
          Container(
            margin: const EdgeInsets.only(left: 24.0),
            child: DropdownButton<String>(
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(value: 'Dart', child: Text('dart')),
                DropdownMenuItem<String>(value: 'Kotlin', child: Text('Kotlin')),
                DropdownMenuItem<String>(value: 'Swift', child: Text('Swift')),
              ],
              value: language,
              hint: const Text('Select Language'),
              onChanged: (String? value) {
                setState(() {
                  language = value;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'write your name here ...',
                      labelText: 'Name : '),
                  onChanged: (String value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Hello, $_name'),
                          );
                        });
                  },
                )
              ],
            ),
          ),
          Switch(
            value: lightOn,
            onChanged: (bool value) {
              setState(() {
                lightOn = value;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(lightOn ? 'light on' : 'light off'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
