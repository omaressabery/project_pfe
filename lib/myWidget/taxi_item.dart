// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class TaxiItem extends StatelessWidget {
  final String image;
  final String name;
  final bool isShow;
  const TaxiItem({
    required this.image,
    required this.name,
    required this.isShow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // trip item : sous forme d'une card contient image, titre....
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  'images/$image',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 200,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(10),

                // تدريج اللون من الاعلى الى الاسفل
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.6),
                      ],
                      stops: const [
                        0.6,
                        1
                      ]),
                ),

                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Alkalami',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*--------------- button supp------*/

                isShow == true
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        iconSize: 30,
                      )
                    : const Center(),

                /*----------- button mod-------------*/

                isShow == true
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        color: Colors.blue,
                        iconSize: 30,
                      )
                    : const Center(),

                /*-------------- Statu de Taxi--------------------------*/

                const Text(
                  "Disponible",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontFamily: 'Alkalami',
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
