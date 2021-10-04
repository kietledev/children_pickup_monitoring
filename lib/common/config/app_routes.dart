import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static PageTransition getRoute(RouteSettings settings) {
    Widget widget;
    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e) {
      widget = Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Không tìm thấy trang'),),
        body: const Center(child: Text('Page not found')),
      );
    }
    return PageTransition(
        child: widget,
        type: PageTransitionType.rightToLeft,
        settings: settings);
  }
}
