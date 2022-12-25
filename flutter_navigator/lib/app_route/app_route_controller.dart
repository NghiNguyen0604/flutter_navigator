import 'package:flutter/material.dart';
import 'package:flutter_navigator/pages/login/login_controller.dart';
import 'package:flutter_navigator/pages/login/login_page.dart';
import 'package:flutter_navigator/pages/splash/splash_page.dart';
import 'package:flutter_navigator/pages/test_drive/test_drive_list/test_drive_list_page.dart';
import 'package:flutter_navigator/pages/test_drive/test_drive_reservation/test_drive_reservation.dart';
import 'package:go_router/go_router.dart';
import 'package:one_context/one_context.dart';

import '../pages/home/home_page.dart';
import '../pages/main/main_page.dart';
import 'nav_bar_tab_item.dart';
import '../pages/test_drive/request_list/request_list_page.dart';
import 'app_route_enum.dart';

class AppRouteController {
  static AppRouteController? _instance;
  static AppRouteController get instance =>
      _instance ??= AppRouteController._();
  AppRouteController._();
  final rootKey = OneContext().key;
  final tabKey = GlobalKey<NavigatorState>();
  List<NavBarTabItem>? _tabs;
  List<NavBarTabItem> get tabs => _tabs!;
  GoRouter? _goRouter;
  GoRouter get goRouter => _goRouter!;
  init() {
    createTabs();
    createRoutes();
  }

  createTabs() {
    _tabs = [
      NavBarTabItem(
        path: AppRouteEnum.home.path,
        name: AppRouteEnum.home.name,
        icon: Icon(Icons.home),
        label: AppRouteEnum.home.description,
      ),
      NavBarTabItem(
        path: AppRouteEnum.testdrive.path,
        name: AppRouteEnum.testdrive.name,
        icon: Icon(Icons.settings),
        label: AppRouteEnum.testdrive.description,
      ),
      NavBarTabItem(
        path: AppRouteEnum.request.path,
        name: AppRouteEnum.request.name,
        icon: Icon(Icons.request_quote),
        label: AppRouteEnum.request.description,
      ),
    ];
  }

  createRoutes() {
    _goRouter = GoRouter(
      initialLocation: AppRouteEnum.splash.path,
      navigatorKey: AppRouteController.instance.rootKey,
      debugLogDiagnostics: true,
      routes: [
        ShellRoute(
          navigatorKey: AppRouteController.instance.tabKey,
          builder: (context, state, child) {
            return MainPage(tabs: tabs, child: child);
          },
          routes: [
            GoRoute(
              path: AppRouteEnum.home.path,
              name: AppRouteEnum.home.name,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: HomePage(
                  label: state.fullpath ?? '',
                ),
              ),
            ),
            GoRoute(
              path: AppRouteEnum.testdrive.path,
              name: AppRouteEnum.testdrive.name,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: TestDriveListPage(
                  label: state.fullpath ?? '',
                ),
              ),
            ),
            GoRoute(
              path: AppRouteEnum.request.path,
              name: AppRouteEnum.request.name,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: RequestListPage(
                  label: state.fullpath ?? '',
                ),
              ),
              
            ),
          ],
        ),
        GoRoute(
          path: AppRouteEnum.login.path,
          name: AppRouteEnum.login.name,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: LoginPage(
              label: state.fullpath ?? '',
              controller: state.extra as LoginController,
            ),
          ),
        ),
        GoRoute(
          path: AppRouteEnum.splash.path,
          name: AppRouteEnum.splash.name,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: SplashPage(
              label: state.fullpath ?? '',
            ),
          ),
        ),
        GoRoute(
          path: AppRouteEnum.reservation.path,
          name: AppRouteEnum.reservation.name,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: TestDriveReservationPage(
              label: state.fullpath ?? '',
            ),
          ),
        )
      ],
    );
  }
}
