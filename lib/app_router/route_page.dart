import 'package:go_router/go_router.dart';
import 'package:gudang/home.dart';
import 'package:gudang/screens/add_category_screen.dart';
import 'package:gudang/screens/assets_screen.dart';
import 'package:gudang/screens/login_page.dart';
import 'package:gudang/screens/maintenance_screen.dart';
import 'package:gudang/screens/manufactur_screen.dart';
import 'package:gudang/screens/mechanic_screen.dart';
import 'package:gudang/screens/model_screen.dart';
import '../models/locations.dart';
import '../screens/add_asset_screen.dart';
import '../screens/add_location_screen.dart';
import '../screens/add_maintenance_screen.dart';
import '../screens/add_manufactur_screen.dart';
import '../screens/add_mehanic_screens.dart';
import '../screens/add_supplier_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/edit_location_screen.dart';
import '../screens/location_screen.dart';
import '../screens/supplier_screen.dart';
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
            path: '/', name: 'home', builder: (context, state) => const Home()),
        GoRoute(
            path: '/addAsset',
            name: 'addAsset',
            builder: (context, state) => const AddAssetScreen()),
        GoRoute(
            path: '/addMaintenance',
            name: 'addMaintenance',
            builder: (context, state) => const AddMaintenanceScreen()),
        GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) => const LoginPage()),
        GoRoute(
            path: '/aset',
            name: 'aset',
            builder: (context, state) => const AssetsScreen()),
        GoRoute(
            path: '/model',
            name: 'model',
            builder: (context, state) => const ModelScreen()),
        GoRoute(
            path: '/maintenance',
            name: 'maintenance',
            builder: (context, state) => const MaintenanceScreen()),
        GoRoute(
            path: '/manufacture',
            name: 'manufacture',
            builder: (context, state) => const ManufacturerScreen()),
        GoRoute(
            path: '/addManufacture',
            name: 'addManufacture',
            builder: (context, state) => const AddManufactureScreen()),
        GoRoute(
            path: '/mechanic',
            name: 'mechanic',
            builder: (context, state) => const MechanicScreen()),
        GoRoute(
            path: '/addMechanic',
            name: 'addMechanic',
            builder: (context, state) => const AddMechanicScreen()),
        GoRoute(
            path: '/supplier',
            name: 'supplier',
            builder: (context, state) => const SupplierScreen()),
        GoRoute(
            path: '/addSupplier',
            name: 'addSupplier',
            builder: (context, state) => const AddSupplierScreen()),
        GoRoute(
            path: '/categories',
            name: 'categories',
            builder: (context, state) => const CategoriesScreen()),
        GoRoute(
            path: '/addCategory',
            name: 'addCategory',
            builder: (context, state) =>  AddCategoryScreen()),
        GoRoute(
            path: '/location',
            name: 'location',
            builder: (context, state) =>  LocationScreen()),
        GoRoute(
            path: '/addLocation',
            name: 'addLocation',
            builder: (context, state) =>  AddLocationScreen()),
        GoRoute(path: '/editLocation',
            name: 'editLocation',
            builder: (context, state){
              Data location = state.extra as Data;
              return EditLocationScreen(location: location);
            }),
      ],
      redirect: (context, state) {

        return null;
      });
}
