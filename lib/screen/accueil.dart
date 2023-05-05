import 'package:flutter/material.dart';
import 'package:auto_taxi/myWidget/menuItem.dart';
import 'package:auto_taxi/screen/login.dart';
import 'package:auto_taxi/screen/register.dart';
import 'package:auto_taxi/screen/information.dart';
import 'package:auto_taxi/screen/contact.dart';
import 'package:auto_taxi/screen/question_answer.dart';
import 'package:auto_taxi/screen/service.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 2,
            children: const <Widget>[
              /*----------------Card Login------------*/
              MyMenu(
                icon: Icons.insert_chart,
                iconColor: Colors.orange,
                title: 'Sign Up',
                toWidget: Register(),
              ),
              /*----------------Card SignUp------------*/
              MyMenu(
                icon: Icons.login,
                iconColor: Colors.blue,
                title: 'Login',
                toWidget: Login(),
              ),
              /*----------------Card Information------------*/
              MyMenu(
                icon: Icons.info,
                iconColor: Colors.blue,
                title: 'Information',
                toWidget: Information(),
              ),
              /*----------------Card Contact------------*/
              MyMenu(
                icon: Icons.contact_page,
                iconColor: Colors.green,
                title: 'contact',
                toWidget: Contact(),
              ),
              /*----------------Card Question/Answer------------*/
              MyMenu(
                icon: Icons.question_answer,
                iconColor: Colors.green,
                title: 'Question/Answer',
                toWidget: QuestioAnswer(),
              ),
              /*----------------Card service ------------*/
              MyMenu(
                icon: Icons.miscellaneous_services_sharp,
                iconColor: Colors.purple,
                title: 'Service',
                toWidget: Service(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
