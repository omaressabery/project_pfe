// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:auto_taxi/main.dart';
import 'package:auto_taxi/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:auto_taxi/myWidget/text_field.dart';
import 'package:auto_taxi/myWidget/lien.dart';
import 'package:auto_taxi/screen/forgot_password.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isloading = false;

  Future login() async {
    isloading = true;
    setState(() {});
    var url = 'http://192.168.56.1/auto_taxi/auth/login.php';
    var res = await http.post(Uri.parse(url), body: {
      'email': emailController.text,
      'password': passController.text,
    });

    if (res.statusCode == 200) {
      isloading = false;
      setState(() {});
      var data = jsonDecode(res.body);
      if (passController.text == "" || passController.text == "") {
        Fluttertoast.showToast(
          msg: 'saisir tous les champs',
          backgroundColor: Colors.red,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      } else if (data['statu'] == 'exist') {
        sharedPref.setString('id', data['data']['id'].toString());
        sharedPref.setString('prenom', data['data']['prenom']);
        sharedPref.setString('nom', data['data']['nom']);
        sharedPref.setString('email', data['data']['email']);
        sharedPref.setString('phone', data['data']['phone']);
        sharedPref.setString('isAdmin', data['data']['isAdmin']);
        sharedPref.setString('photo', data['data']['photo']);
        Fluttertoast.showToast(
          msg: 'Bienvenu chez votre compte',
          backgroundColor: Colors.green,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
        Navigator.of(context).pushNamed("home");
        emailController.text = "";
        passController.text = "";
      } else {
        Fluttertoast.showToast(
          msg: 'votre email ou mot de passe est incorrect',
          backgroundColor: Colors.red,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/taxi22.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        // Positioned(
                        //   left: 30,
                        //   width: 80,
                        //   height: 70,
                        //   child: Container(
                        //     decoration: const BoxDecoration(
                        //       image: DecorationImage(
                        //         image: AssetImage(
                        //           'images/image1.jpg',
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          right: 40,
                          top: 0,
                          width: 80,
                          height: 80,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/image1.jpg',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                              /*--------------champ email-----------------*/
                              MyTextField(
                                controller: emailController,
                                icon: Icons.email,
                                notSowText: false,
                                placeholder: 'Email',
                              ),
                              /*------------champ mot de passe-------------------*/
                              MyTextField(
                                controller: passController,
                                icon: Icons.lock,
                                notSowText: true,
                                placeholder: 'mot de passe',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        /*-----------Button Login--------------*/
                        GestureDetector(
                          onTap: () {
                            login();
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
                                      'Connexion',
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
                        /*----------------mot de passe oublier--------------------*/
                        const Lien(
                          title: 'mot de passe oublier ?',
                          toWidget: ForgotPassword(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /*-------- vous n'avez pas un compte -------*/
                        const Lien(
                          title: 'vous n\'avez pas un compte ?',
                          toWidget: Register(),
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
      ),
    );
  }
}
