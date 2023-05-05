import 'package:flutter/material.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("users"),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Card(
            color: Colors.grey,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
