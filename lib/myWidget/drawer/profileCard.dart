import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String photo;
  final String username;
  final String email;
  final String phone;
  const ProfileCard({
    super.key,
    required this.photo,
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.cyan, boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 10,
          offset: Offset(0, 10),
        ),
      ]),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/$photo'),
              ),
            ),
          ),
          Text(
            username.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 2,
              wordSpacing: 5,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black,
              fontFamily: 'VarFont',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Email: $email',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Telephone: $phone',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
