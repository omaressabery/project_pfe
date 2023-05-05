import 'package:flutter/material.dart';
import 'package:auto_taxi/myWidget/drawer/profileCard.dart';
import 'package:auto_taxi/myWidget/drawer/drawer_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? fname;
  String? lname;
  String? email;
  String? phone;
  String? isAdmin;
  String? photo;
  getPref() async {
    SharedPreferences shpref = await SharedPreferences.getInstance();
    setState(() {
      fname = shpref.getString('prenom');
      lname = shpref.getString('nom');
      email = shpref.getString('email');
      phone = shpref.getString('phone');
      isAdmin = shpref.getString('isAdmin');
      photo = shpref.getString('photo');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPref();
    super.initState();
  }

  logout() async {
    SharedPreferences shpref = await SharedPreferences.getInstance();
    shpref.remove('id');
    Navigator.of(context).pushNamed('login');
  }

  listTaxi() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Home'),
          ),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                /*--------------Profile---------------*/
                ProfileCard(
                    photo: 'profile.jpg',
                    username: '$fname $lname',
                    email: '$email',
                    phone: "$phone"),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    /*-----------------Deconnexion--------------------*/
                    const DrawerButton(
                      name: 'Dashborard',
                      icon: Icons.dashboard,
                      iconColor: Colors.purple,
                      routeName: '',
                    ),

                    /*-----------------list users--------------------*/
                    isAdmin == '1'
                        ? const DrawerButton(
                            name: 'Liste des utilisateurs',
                            icon: Icons.people,
                            iconColor: Colors.grey,
                            routeName: 'allusers',
                          )
                        : const Center(),

                    /*-----------------Button vers list Taxi--------------------*/
                    const DrawerButton(
                      name: 'Liste des Taxi',
                      icon: Icons.local_taxi,
                      iconColor: Colors.red,
                      routeName: "alltaxi",
                    ),
                    /*-----------------Taxis Disponible--------------------*/
                    const DrawerButton(
                      name: 'Taxis Disponible',
                      icon: Icons.local_taxi_sharp,
                      iconColor: Colors.blue,
                      routeName: '',
                    ),

                    /*-----------------Taxi Réserver--------------------*/

                    const DrawerButton(
                      name: 'Taxis Réserver',
                      icon: Icons.taxi_alert_rounded,
                      iconColor: Colors.orange,
                      routeName: '',
                    ),

                    /*-----------------Contact--------------------*/
                    const DrawerButton(
                      name: 'Contact',
                      icon: Icons.contact_page,
                      iconColor: Colors.green,
                      routeName: '',
                    ),

                    /*-----------------Paramètre--------------------*/
                    const DrawerButton(
                      name: 'Paramètre',
                      icon: Icons.settings,
                      iconColor: Colors.grey,
                      routeName: '',
                    ),

                    /*-----------------Deconnexion--------------------*/
                    const DrawerButton(
                      name: 'Deconnexion',
                      icon: Icons.logout,
                      iconColor: Colors.red,
                      routeName: 'login',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
