import 'package:gudang/state_manager/register_state.dart';
import 'package:gudang/thema.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_router/route_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gudang/state_manager/thema_state.dart';
import 'package:gudang/state_manager/app_state_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final appStateManager = AppStateManager(sharedPreferences);
  appStateManager.initializeApp();
  runApp(MyApp(
    appStateManager: appStateManager,
    formState: FormState(),
  ));
}

class MyApp extends StatefulWidget {
  final AppStateManager appStateManager;
  final FormState formState;
  const MyApp(
      {Key? key, required this.appStateManager, required this.formState})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _appRouter = RoutePage(widget.appStateManager);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemaState(),
        ),
        ChangeNotifierProvider(create: (context) => RegisterState()),
        ChangeNotifierProvider(create: (context) => widget.appStateManager),
      ],
      child: Consumer<ThemaState>(
        builder: (context, themaState, child) {
          ThemeData theme;
          if (themaState.darkmode) {
            theme = ThemaMaBukitAsam.light();
          } else {
            theme = ThemaMaBukitAsam.dark();
          }
          return MaterialApp.router(
            theme: theme,
            title: 'SIMMAS',
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.router.routerDelegate,
            routeInformationParser: _appRouter.router.routeInformationParser,
            routeInformationProvider:
                _appRouter.router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
