import 'package:flutter/material.dart';
import 'package:flutter_dasar_id_camp/five_screen.dart';

class SixScreen extends StatefulWidget {
  final String data;
  const SixScreen({super.key, required this.data});

  @override
  State<SixScreen> createState() => _SixScreenState();
}

class _SixScreenState extends State<SixScreen> {
  late String _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Six Screen'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Text('kembali navigasi menggunakan navigator pop'),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const FiveScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 0.0); // Perubahan disini
                            const end = Offset(1.0, 0.0); // Perubahan disini
                            const curve = Curves.easeInOutCubic;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text('<- kembali'),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  const Text('Six Screen telah menerima data seperti dibawah ini:'),
                  Text(
                    _data,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
