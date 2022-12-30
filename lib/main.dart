import 'package:flutter/material.dart';
import 'package:gudang/thema.dart';
import 'app_router/route_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late final _router = RoutePage();

    return MaterialApp.router(
      theme: ThemaMaBukitAsam.light(),
      title: 'SIMAS',
      routerDelegate: _router.router.routerDelegate,
      routeInformationParser: _router.router.routeInformationParser,
      routeInformationProvider: _router.router.routeInformationProvider,
    );
  }
}

