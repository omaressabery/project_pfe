import 'package:auto_taxi/myApp/home.dart';
import 'package:auto_taxi/screen/login.dart';
import 'package:auto_taxi/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:auto_taxi/screen/accueil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_taxi/myApp/list_taxi.dart';
import 'package:auto_taxi/myApp/list_user.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Center(
                child: Text(
                  'TAXI EN LIGNE',
                  style: TextStyle(
                    fontFamily: 'Alkalami',
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            body: const Accueil(),
          ),
        ),
        initialRoute: sharedPref.getString('id') == null ? 'accueil' : 'home',
        routes: {
          "accueil": (context) => const Accueil(),
          "login": (context) => const Login(),
          "register": (context) => const Register(),
          "home": (context) => const Home(),
          "alltaxi": (context) => const ListTaxi(),
          "allusers": (context) => const ListUsers(),
        });
  }
}
