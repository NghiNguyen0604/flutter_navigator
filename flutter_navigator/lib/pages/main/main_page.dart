import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_route/nav_bar_tab_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.child, required this.tabs})
      : super(key: key);
  final Widget child;
  final List<NavBarTabItem> tabs;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _locationToTabIndex(String location) {
    final index = widget.tabs.indexWhere((t) => location.contains(t.path));
    return index < 0 ? 0 : index;
  }

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.pushNamed(widget.tabs[tabIndex].name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tabs[_currentIndex].label ?? ''),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: widget.tabs,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
