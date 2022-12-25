import 'package:flutter/material.dart';
import 'package:flutter_navigator/app_route/app_route_enum.dart';
import 'package:go_router/go_router.dart';

class TestDriveReservationPage extends StatelessWidget {
  const TestDriveReservationPage({required this.label, Key? key})
      : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(label),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                context.pushReplacement(AppRouteEnum.testdrive.path);
              },
              child: const Text('Back to Test Drive List Page.'),
            ),
          ],
        ),
      ),
    );
  }
}
