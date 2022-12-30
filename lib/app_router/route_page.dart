import 'package:go_router/go_router.dart';
import 'package:gudang/home.dart';
import '../screens/add_asset_screen.dart';

class RoutePage {

  late final router = GoRouter(
    debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(path: '/',name: 'home',
        builder: (context, state) => Home()
        ),
        GoRoute(
            path: '/addAsset',
            name: 'addAsset',
          builder: (context, state) => const AddAssetScreen(),
        ),
      ],
    redirect:(context, state){

    }
  );
}