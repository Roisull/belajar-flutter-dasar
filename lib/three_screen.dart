import 'package:flutter/material.dart';
import 'package:flutter_dasar_id_camp/four_screen.dart';

class ThreeScreen extends StatefulWidget {
  const ThreeScreen({super.key});

  @override
  State<ThreeScreen> createState() => _ThreeScreenState();
}

class _ThreeScreenState extends State<ThreeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Three Screen'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black)),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.black)),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.black)),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black)),
            child: const Center(
              child: Text(
                '4',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.black)),
            child: const Center(
              child: Text(
                '5',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.black)),
            child: const Center(
              child: Text(
                '6',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const FourScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = 0.0;
                    const end = 1.0;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var scaleAnimation = animation.drive(tween);

                    return ScaleTransition(
                      scale: scaleAnimation,
                      child: child,
                    );
                  },
                ),
              );
                },
                child: const Text('Go to Four Screen'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
