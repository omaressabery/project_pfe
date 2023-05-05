import 'package:flutter/material.dart';
import 'package:auto_taxi/myWidget/text_field.dart';
import 'package:auto_taxi/myWidget/myButton.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmePassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Changer le mot de passe',
            style: TextStyle(
              fontFamily: 'Alkalami',
              fontSize: 20.0,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 240, 190, 114),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(0),
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
                            /*--------------champ email-----------------*/
                            MyTextField(
                              controller: emailController,
                              icon: Icons.email,
                              notSowText: false,
                              placeholder: 'Email',
                            ),
                            /*------------nouveau mot de passe-------------------*/
                            MyTextField(
                              controller: passController,
                              icon: Icons.lock,
                              notSowText: true,
                              placeholder: 'Nouveau mot de passe',
                            ),

                            /*------------confirmer mot de passe-------------------*/
                            MyTextField(
                              controller: confirmePassController,
                              icon: Icons.lock,
                              notSowText: true,
                              placeholder: 'Confirmer le mot de passe',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      /*--------------button modifier--------------*/
                      const MyButton(
                        buttonName: 'Modifier',
                        buttonBackgroundColor: Colors.green,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
