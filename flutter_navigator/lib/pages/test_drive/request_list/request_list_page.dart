import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_route/app_route_enum.dart';

class RequestListPage extends StatelessWidget {
  const RequestListPage({required this.label, Key? key}) : super(key: key);

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
              onPressed: () => {
                context.goNamed(AppRouteEnum.reservation.name),
              },
              child: const Text('Go to Test Drive Reservation Page.'),
            ),
          ],
        ),
      ),
    );
  }
}
