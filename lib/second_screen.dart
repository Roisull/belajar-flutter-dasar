import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? language;
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Radio<String>(
              value: 'Dart',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackBar();
                });
              },
            ),
            title: const Text('Dart'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Kotlin',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackBar();
                });
              },
            ),
            title: const Text('Kotlin'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Swift',
              groupValue: language,
              onChanged: (String? value) {
                setState(() {
                  language = value;
                  showSnackBar();
                });
              },
            ),
            title: const Text('Swift'),
          ),
          ListTile(
            leading: Checkbox(
              value: agree,
              onChanged: (bool? value){
                setState(() {
                  agree = value!;
                });
              },
            ),
            title: const Text('agree'),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                    'https://picsum.photos/200/300',
                    width: 100,
                    height: 100,
              ),
              Image.asset(
                'assets/images/logo_pezy.png',
                width: 100,
                height: 100,
              ),
              Image.asset(
                'assets/images/pezy_text.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: const Column(
              children: [
                Text(
                  'Ini Font Roboto Bold',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Ini Roboto Italic',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Ini Font Roboto Thin',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.w100,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text('$language selected'),
            duration: const Duration(seconds: 1),
          ));
  }
}
