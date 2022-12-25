import 'package:flutter/material.dart';
import 'package:flutter_navigator/app_route/app_route_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppRouteController.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouteController.instance.goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

