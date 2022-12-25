import 'package:flutter/material.dart';

class TestDriveListPage extends StatelessWidget {
  const TestDriveListPage({required this.label, Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(label),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () => {},
              child: const Text('Go to Test Drive Reservation Page.'),
            ),
          ],
        ),
      ),
    );
  }
}
