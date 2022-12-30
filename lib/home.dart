import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/screens/assets_screen.dart';
import 'package:gudang/screens/maintenance_screen.dart';
import 'package:gudang/screens/settings_screen.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;
  
  static List<Widget> pages = <Widget>[
    AssetsScreen(),
    MaintenanceScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIMAS'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedTab,
        onTap: (index){
          setState(() {
            _selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.luggage), label: 'Barang'),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: 'Perbaikan'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan')
        ],
      ),
        floatingActionButton: (_selectedTab) < 2 ? FloatingActionButton(
            onPressed: (){
              if(_selectedTab == 0) {
                context.push('/addAsset');
              } else {
                Navigator.pushNamed(context, '/addMaintenance');
              }
            },
        child: const Icon(Icons.add, color: Colors.white,),) : null ,
    );
  }
}
