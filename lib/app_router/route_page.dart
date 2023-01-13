import 'package:go_router/go_router.dart';
import 'package:gudang/home.dart';
import 'package:gudang/models/manufacturer.dart' as manufactur;

import 'package:gudang/screens/add_category_screen.dart';
import 'package:gudang/screens/assets_screen.dart';
import 'package:gudang/screens/edit_supplier_screen.dart';
import 'package:gudang/screens/login_page.dart';
import 'package:gudang/screens/maintenance_screen.dart';
import 'package:gudang/screens/manufactur_screen.dart';
import 'package:gudang/screens/mechanic_screen.dart';
import 'package:gudang/screens/model_screen.dart';
import '../models/locations.dart' as locations;
import '../models/categories.dart' as categories;
import '../models/mechanic.dart' as mehcnic;
import '../models/suppliers.dart' as supplier;
import '../screens/add_asset_screen.dart';
import '../screens/add_location_screen.dart';
import '../screens/add_maintenance_screen.dart';
import '../screens/add_manufactur_screen.dart';
import '../screens/add_mehanic_screens.dart';
import '../screens/add_model_screens.dart';
import '../screens/add_supplier_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/edit_categories_screen.dart';
import '../screens/edit_location_screen.dart';
import '../screens/edit_manufactur_screen.dart';
import '../screens/edit_mechanic_screen.dart';
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
            path: '/addModel',
            name: 'addModel',
            builder: (context, state) => AddModelScreens()),
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
            path: '/editManufacturer',
            name: 'editManufacturer',
            builder: (context, state) {
              return EditManufacturScreen(
                manufactur: state.extra as manufactur.Data,
              );
            }),
        GoRoute(
            path: '/mechanic',
            name: 'mechanic',
            builder: (context, state) => const MechanicScreen()),
        GoRoute(
            path: '/addMechanic',
            name: 'addMechanic',
            builder: (context, state) => const AddMechanicScreen()),
        GoRoute(
            path: '/editMechanic',
            name: 'editMechanic',
            builder: (context, state) {
              return EditMechanicScreen(
                mechanic: state.extra as mehcnic.Data,
              );
            }),
        GoRoute(
            path: '/supplier',
            name: 'supplier',
            builder: (context, state) => const SupplierScreen()),
        GoRoute(
            path: '/addSupplier',
            name: 'addSupplier',
            builder: (context, state) => const AddSupplierScreen()),
        GoRoute(
            path: '/editSupplier',
            name: 'editSupplier',
            builder: (context, state) {
              final sp = state.extra as supplier.Data;
              return EditSupplierScreen(supplier: sp,);
            }),
        GoRoute(
            path: '/categories',
            name: 'categories',
            builder: (context, state) => const CategoriesScreen()),
        GoRoute(
            path: '/addCategory',
            name: 'addCategory',
            builder: (context, state) => AddCategoryScreen()),
        GoRoute(
            path: '/editCategories',
            name: 'editCategories',
            builder: (context, state) {
              final category = state.extra as categories.Data;
              return EditCategoriesScreen(category: category);
            }),
        GoRoute(
            path: '/location',
            name: 'location',
            builder: (context, state) => const LocationScreen()),
        GoRoute(
            path: '/addLocation',
            name: 'addLocation',
            builder: (context, state) => AddLocationScreen()),
        GoRoute(
            path: '/editLocation',
            name: 'editLocation',
            builder: (context, state) {
              return EditLocationScreen(
                  location: state.extra as locations.Data);
            }),
      ],
      redirect: (context, state) {
        return null;
      });
}
