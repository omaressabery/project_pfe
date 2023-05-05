import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:auto_taxi/myWidget/text_field.dart';
import 'package:auto_taxi/myWidget/lien.dart';
import 'package:auto_taxi/screen/login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController prenomController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool isloading = false;

  Future register() async {
    await Future.delayed(const Duration(seconds: 2));
    isloading = true;
    setState(() {});
    var url = 'http://192.168.56.1/taxi_auto/auth/register.php';
    var data = {
      'fname': prenomController.text,
      'lname': nomController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passController.text,
      'cpassword': confirmPassController.text,
    };
    var res = await http.post(
      Uri.parse(url),
      body: data,
    );

    if (res.statusCode == 200) {
      isloading = false;
      setState(() {});
      var data = jsonDecode(res.body);
      if (prenomController.text == "" ||
          nomController.text == "" ||
          emailController.text == "" ||
          phoneController.text == "" ||
          passController.text == "" ||
          confirmPassController.text == "") {
        Fluttertoast.showToast(
          msg: 'saisir tous les champs',
          backgroundColor: Colors.red,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      } else {
        if (data['statu'] == 'exist') {
          Fluttertoast.showToast(
            msg: 'essayer de changer email, car ce dernier existe déjà',
            backgroundColor: Colors.red,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0,
          );
        } else {
          if (data['statu'] == 'created') {
            Fluttertoast.showToast(
              msg: 'votre compte est creé',
              backgroundColor: Colors.green,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0,
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return const Login();
                },
              ),
            );
          } else {
            Fluttertoast.showToast(
              msg: 'vous etes erreur!!!',
              backgroundColor: Colors.red,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0,
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 190, 114),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/image1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            /*--------------champ Preom-----------------*/
                            MyTextField(
                              controller: prenomController,
                              icon: Icons.person_4,
                              notSowText: false,
                              placeholder: 'Prenom',
                            ),
                            /*--------------champ Nom-----------------*/
                            MyTextField(
                              controller: nomController,
                              icon: Icons.family_restroom,
                              notSowText: false,
                              placeholder: 'Nom',
                            ),
                            /*--------------champ email-----------------*/
                            MyTextField(
                              controller: emailController,
                              icon: Icons.email,
                              notSowText: false,
                              placeholder: 'Email',
                            ),
                            /*--------------champ phone-----------------*/
                            MyTextField(
                              controller: phoneController,
                              icon: Icons.phone,
                              notSowText: false,
                              placeholder: 'Numéro de Telephone',
                            ),
                            /*--------------champ mot de passe-----------------*/
                            MyTextField(
                              controller: passController,
                              icon: Icons.lock,
                              notSowText: true,
                              placeholder: 'Mot de passe',
                            ),
                            /*------------champ confirm mot de passe-------------------*/
                            MyTextField(
                              controller: confirmPassController,
                              icon: Icons.lock,
                              notSowText: true,
                              placeholder: 'confirme mot de passe',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      /*----------Button Register----------------*/
                      GestureDetector(
                        onTap: () {
                          register();
                        },
                        child: isloading == true
                            ? const CircularProgressIndicator()
                            : Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(colors: [
                                      Colors.blue,
                                      Colors.lightBlueAccent,
                                    ])),
                                child: const Center(
                                  child: Text(
                                    'Enregistrer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      /*-------- vous avez un compte -------*/
                      const Lien(
                        title: 'vous avez un compte',
                        toWidget: Login(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
