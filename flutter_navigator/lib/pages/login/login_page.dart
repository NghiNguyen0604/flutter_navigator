import 'package:flutter/material.dart';
import 'package:flutter_navigator/app_route/app_route_enum.dart';
import 'package:flutter_navigator/pages/login/login_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

Widget createLoginPage({
  required LoginController controller,
}) {
  controller.status.listen(
    (status) {
      if (status) {
        controller.state!.context.pushReplacementNamed(AppRouteEnum.home.name);
      }
    },
  );
  return LoginPage(
      label: 'Login',
      controller: controller,
    );
}


class LoginPage extends StatefulWidget {
  const LoginPage({required this.label, Key? key, required this.controller})
      : super(key: key);
  final String label;
  final LoginController controller;
  @override
  StateMVC<LoginPage> createState() => _LoginPageState(controller);
}

class _LoginPageState extends StateMVC<LoginPage> {
  late LoginController _con;
  _LoginPageState(LoginController controller) : super(controller) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.label),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                context.go(AppRouteEnum.home.path);
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
