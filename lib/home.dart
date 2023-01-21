import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gudang/state_manager/app_state_manager.dart';
import 'package:gudang/state_manager/thema_state.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIMAS'),
        actions: [
          Switch(value: _isDark, onChanged: (value){
            Provider.of<ThemaState>(context, listen: false).darkMode(value);
            setState(() {
              _isDark = value;
            });
          })
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            menu('Aset', 'assets/images/aset.png', '/aset'),
            menu('Model', 'assets/images/model.png', '/model'),
            menu('Perbaikan', 'assets/images/maintenance.png', '/maintenance'),
            menu('Pabrikan', 'assets/images/factory.png', '/manufacture'),
            menu('Teknisi', 'assets/images/mechanic.png', '/mechanic'),
            menu('Pemasok', 'assets/images/supplier.png', '/supplier'),
            menu('Kategori', 'assets/images/categories.png', '/categories'),
            menu('Lokasi', 'assets/images/location.png', '/location'),
            ElevatedButton(onPressed: (){
              Provider.of<AppStateManager>(context, listen: false).logout();
            }, child: const Text('Logout')),
          ],
        ),
      ),
    );
  }

  Widget menu(String title, String image, String route) {
    return InkWell(
      onTap: () {
        context.push(route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset(image),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style:  GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
