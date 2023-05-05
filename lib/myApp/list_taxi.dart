import 'package:flutter/material.dart';
import 'package:auto_taxi/myWidget/taxi_item.dart';
import 'package:auto_taxi/myWidget/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ListTaxi extends StatefulWidget {
  const ListTaxi({super.key});

  @override
  State<ListTaxi> createState() => _ListTaxiState();
}

class _ListTaxiState extends State<ListTaxi> {
  TextEditingController nom = TextEditingController();
  TextEditingController matricule = TextEditingController();
  TextEditingController image = TextEditingController();
  String? isAdmin;
  bool affiche = false;
  getPref() async {
    SharedPreferences shpref = await SharedPreferences.getInstance();
    setState(() {
      isAdmin = shpref.getString('isAdmin');
      if (isAdmin == '1') {
        affiche = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPref();
    super.initState();
  }

  /*------------------ Dialog for add Taxi -----------*/

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Ajouter un Taxi')),
          content: SingleChildScrollView(
            child: Column(
              children: [
                MyTextField(
                    controller: nom,
                    icon: Icons.local_taxi,
                    notSowText: false,
                    placeholder: "Nom de taxi"),
                MyTextField(
                    controller: matricule,
                    icon: Icons.token,
                    notSowText: false,
                    placeholder: "Maricule"),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ajouter'),
              onPressed: () {
                addTaxi();

                Navigator.of(context).pop();
                nom.text = "";
                matricule.text = "";
              },
            ),
          ],
        );
      },
    );
  }

  /*------------add taxi function-------------*/
  Future addTaxi() async {
    var url = 'http://192.168.56.1/taxi_auto/myApp/add_taxi.php';
    var res = await http.post(Uri.parse(url), body: {
      'nom': nom.text,
      'matricule': matricule.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des taxis'),
        actions: [
          isAdmin == '1'
              ? IconButton(
                  onPressed: () {
                    _dialogBuilder(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                )
              : const Center(),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Center(
          child: TaxiItem(
            image: 'image1.jpg',
            name: 'Dacia',
            isShow: affiche,
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
