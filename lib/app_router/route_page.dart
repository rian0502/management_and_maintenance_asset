import 'package:go_router/go_router.dart';
import 'package:gudang/home.dart';
import 'package:gudang/screens/login_page.dart';
import '../screens/add_asset_screen.dart';
import '../screens/add_maintenance_screen.dart';
import '../state_manager/app_state_manager.dart';

class RoutePage {
  final AppStateManager? appStateManager;

  RoutePage(this.appStateManager);

  late final router = GoRouter(
    debugLogDiagnostics: true,
      refreshListenable: appStateManager,
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            name: 'home',
        builder: (context, state) => Home()
        ),
        GoRoute(
            path: '/addAsset',
            name: 'addAsset',
          builder: (context, state) => const AddAssetScreen(),
        ),
        GoRoute(
            path: '/addMaintenance',
            name: 'addMaintenance',
            builder: (context, state) => const AddMaintenanceScreen()
        ),
        GoRoute(path: '/login', name: 'login', builder: (context, state) => const LoginPage()),
      ],
    redirect:(context, state){
        if(state.location == '/addAsset' || state.location == '/addMaintenance'){
          if(appStateManager!.isLoggedIn == false){
            return '/login';
          }
        }
    }
  );
}