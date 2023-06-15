import 'package:flutter/material.dart';
import 'package:inventory_flutter/helper/shared_pref.dart';
import 'package:inventory_flutter/ui/pages/form_page.dart';
import 'package:inventory_flutter/ui/pages/search_page.dart';
import 'package:inventory_flutter/ui/widgets/grid_list.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  static const String route = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.route);
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              SharedPref sharedPref = SharedPref();
              await sharedPref.remove('login');
              if (!context.mounted) return;
              Navigator.pushReplacementNamed(context, LoginPage.route);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const GridList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => const FormPage(),
          );
          Navigator.push(context, route);
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
