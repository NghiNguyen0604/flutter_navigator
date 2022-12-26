import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_navigator/app_route/app_route_enum.dart';
import 'package:flutter_navigator/pages/login/login_controller.dart';
import 'package:go_router/go_router.dart';

Future<String> goLoginOrHomeView(LoginController controller) async {
  final c = Completer<String>();
  final controller = LoginController();
  // auto login
  // do sign in
  controller.status.take(1).listen((status) {
    if (status) {
      c.complete(AppRouteEnum.home.name);
    }
  });
  c.complete(AppRouteEnum.login.name);
  return c.future;
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.label});
  final String label;
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        checkLogin();
      },
    );
  }

  Future<void> checkLogin() async {
    final loginController = LoginController();
    final routeName = await goLoginOrHomeView(loginController);
    context.goNamed(routeName, extra: loginController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.label)),
    );
  }
}
