// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List list = [];

  /*----------------Read data function--------------------*/
  Future readData() async {
    var url = 'http://192.168.56.1/auto_taxi/my_app/list_users.php';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      setState(() {
        list.addAll(red);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  // Future getData() async {
  //   await readData();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Les Utilisateurs ",
            style: TextStyle(
              fontFamily: 'VarFont',
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) {
            return Container(
              margin: const EdgeInsets.all(5),
              child: Card(
                shadowColor: Colors.black,
                elevation: 10,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      child: Image(
                        image: AssetImage("images/profile.jpg"),
                      ),
                    ),
                    title: Text(
                      list[i]['prenom'] + " " + list[i]["nom"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        SingleChildScrollView(
                          child: Row(
                            children: [
                              const Icon(Icons.email),
                              const SizedBox(width: 5),
                              Text(list[i]["email"]),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        SingleChildScrollView(
                          child: Row(
                            children: [
                              const Icon(Icons.phone),
                              const SizedBox(width: 5),
                              Text(list[i]["phone"]),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Dialogs.materialDialog(
                          msg: "Êtes-vous sûr de vouloir supprimer " +
                              list[i]['prenom'] +
                              " ?",
                          title: "Supprimer " + list[i]['prenom'],
                          color: Colors.white,
                          context: context,
                          actions: [
                            IconsOutlineButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              text: 'Annuler',
                              iconData: Icons.cancel_outlined,
                              textStyle: const TextStyle(color: Colors.grey),
                              iconColor: Colors.grey,
                            ),
                            IconsButton(
                              onPressed: () {},
                              text: 'Supprimer',
                              iconData: Icons.delete,
                              color: Colors.red,
                              textStyle: const TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ],
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}
