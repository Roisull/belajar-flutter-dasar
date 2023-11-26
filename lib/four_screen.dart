import 'package:flutter/material.dart';
import 'package:flutter_dasar_id_camp/five_screen.dart';

class FourScreen extends StatefulWidget {
  const FourScreen({super.key});

  @override
  State<FourScreen> createState() => _FourScreenState();
}

class _FourScreenState extends State<FourScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Four Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 124, 244, 54),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 127, 54, 244),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 54, 184, 244),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromARGB(255, 216, 244, 54),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 82, 54, 244),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 98, 244, 54),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const FiveScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = 0.0;
                            const end = 1.0;
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var opacityAnimation = animation.drive(tween);

                            return FadeTransition(
                              opacity: opacityAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text('Go to Five Screen')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
