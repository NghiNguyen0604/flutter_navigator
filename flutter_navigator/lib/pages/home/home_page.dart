import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.label, Key? key}) : super(key: key);

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
              child: const Text('View details'),
            ),
          ],
        ),
      ),
    );
  }
}
