import 'package:flutter/material.dart';

class FiveScreen extends StatefulWidget {
  const FiveScreen({super.key});

  @override
  State<FiveScreen> createState() => _FiveScreenState();
}

class _FiveScreenState extends State<FiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Five Screen'),
      ),
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ExpandedWidget(),
                FlexibelWidget()
              ],
            ),
            Row(
              children: <Widget>[
                ExpandedWidget(),
                ExpandedWidget()
              ],
            ),
            Row(
              children: <Widget>[
                FlexibelWidget(),
                FlexibelWidget()
              ],
            ),
            Row(
              children: <Widget>[
                ExpandedWidget(),
                FlexibelWidget()
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
