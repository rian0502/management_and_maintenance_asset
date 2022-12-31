import 'package:flutter/material.dart';
import 'package:gudang/home.dart';
import 'package:gudang/state_manager/app_state_manager.dart';
import 'package:gudang/thema.dart';
import 'package:provider/provider.dart';
import 'app_router/route_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  runApp(MyApp(appStateManager: appStateManager,));
}

class MyApp extends StatefulWidget {
  final AppStateManager appStateManager;
  const MyApp({Key? key, required this.appStateManager}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _appRouter = RoutePage(widget.appStateManager);
  @override
  Widget build(BuildContext context) {
    return Provider(create: (context) => widget.appStateManager,
    child: MaterialApp.router(
      theme: ThemaMaBukitAsam.light(),
      title: 'SIMMAS',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.router.routerDelegate,
      routeInformationParser: _appRouter.router.routeInformationParser,
      routeInformationProvider: _appRouter.router.routeInformationProvider,
    ),);
  }
}


