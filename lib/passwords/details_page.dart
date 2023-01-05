import 'package:flutter/material.dart';

import 'models/password.dart';

class DetailsPage extends StatelessWidget {
  final Password password;

  const DetailsPage(
      {super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, Password("${password.title}edit", "","",""));
          },
          child: Text(password.title),
        ),
      ),
    );
  }
}