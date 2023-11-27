import 'package:flutter/material.dart';
import 'package:flutter_dasar_id_camp/six_screen.dart';

class FiveScreen extends StatefulWidget {
  const FiveScreen({super.key});

  @override
  State<FiveScreen> createState() => _FiveScreenState();
}

class _FiveScreenState extends State<FiveScreen> {
  String _data = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Five Screen'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                const Row(
                  children: <Widget>[
                    ExpandedWidget(),
                    FlexibelWidget()
                  ],
                ),
                const Row(
                  children: <Widget>[
                    ExpandedWidget(),
                    ExpandedWidget()
                  ],
                ),
                const Row(
                  children: <Widget>[
                    FlexibelWidget(),
                    FlexibelWidget()
                  ],
                ),
                const Row(
                  children: <Widget>[
                    ExpandedWidget(),
                    FlexibelWidget()
                  ],
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Tombol untuk latihan navigasi / intent menggunakn navigator push',
                          textAlign: TextAlign.center,
                        ),
                        OutlinedButton(
                          onPressed: (){
                            Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    SixScreen(data: _data),
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
                          child: const Text('Navigasi ->')
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 20),
                        const Text('Tombol untuk mengirim data antar screen'),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'masukkan data',
                            labelText: 'masukkan :',
                          ),
                          onChanged: (String value){
                            setState(() {
                              _data = value;
                            });
                          }
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          onPressed: (){
                            Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    SixScreen(data: _data),
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
                          child: const Text('kirim data')
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.teal, border: Border.all(color: Colors.white)),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class FlexibelWidget extends StatelessWidget {
  const FlexibelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow, border: Border.all(color: Colors.white)),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
