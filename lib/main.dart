import 'package:flutter/material.dart';
import 'package:inventory_flutter/helper/shared_pref.dart';
import 'package:inventory_flutter/provider/item_provider.dart';
import 'package:inventory_flutter/ui/pages/home_page.dart';
import 'package:inventory_flutter/ui/pages/login_page.dart';
import 'package:inventory_flutter/ui/pages/search_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref sharedPref = SharedPref();
  bool loginPref = await sharedPref.read('Login');

  runApp(MyApp(
    loginPref: loginPref,
  ));
}

class MyApp extends StatelessWidget {
  final bool loginPref;

  const MyApp({super.key, required this.loginPref});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(232, 231, 28, 146)),
          useMaterial3: true,
        ),
        home:loginPref ?  const HomePage() : const LoginPage(),
        routes: {
          LoginPage.route : (context) => const LoginPage(),
          HomePage.route : (context) => const HomePage(),
          SearchPage.route : (context) => const SearchPage(),    
        },
      ),
    );
  }
}
