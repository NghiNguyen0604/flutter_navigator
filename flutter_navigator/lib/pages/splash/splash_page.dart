import 'package:flutter/material.dart';
import 'package:flutter_navigator/app_route/app_route_enum.dart';
import 'package:flutter_navigator/pages/login/login_controller.dart';
import 'package:go_router/go_router.dart';

goLoginOrHomeView(BuildContext context) {
  final _controller = LoginController();
  _controller.status.listen((status) {
    if (status) {
      _controller.state!.context.pushReplacementNamed(AppRouteEnum.home.name);
    }
  });
  context.pushReplacementNamed(AppRouteEnum.login.name, extra: _controller);
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

  void checkLogin() {
    goLoginOrHomeView(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.label)),
    );
  }
}
