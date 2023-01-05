import 'package:flutter/material.dart';

import 'models/password.dart';

class NewPassword extends StatefulWidget {
  Password password = Password(" ", " ", " ", " ");

  NewPassword({super.key, required this.password});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool isEditing = false;
  Icon icon = const Icon(Icons.edit);
  @override
  Widget build(BuildContext context) {
    // const title = password.title == " "? "Nouveau mot de passe":password.title;
    var controllers = {
      "title": TextEditingController(text: widget.password.title),
      "url": TextEditingController(text: widget.password.url),
      "login": TextEditingController(text: widget.password.login),
      "password": TextEditingController(text: widget.password.password),
    };

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFBEBEBE),
          title: const Center(
              child: Text(
                  style: TextStyle(color: Color(0xFF1E1E1E)), "PassKeeper"))),
      body: Container(
        color: const Color(0xFF1E1E1E),
        child: ListView(
          children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Description
                const Padding(
                  padding:
                  //EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  EdgeInsets.only(top: 32.0, bottom: 16.0, left: 16.0),
                  child: Text(
                    "Titre :",
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    controller: controllers['title'],
                    enabled: isEditing,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Title",
                    ),
                    style:
                    const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const Divider(thickness: 10, color: Color(0xFF1E1E1E)),

                //URL
                const Padding(
                  padding:
                  //EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
                  child: Text(
                    "URL :",
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    controller: controllers['url'],
                    enabled: isEditing,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "URL"
                    ),
                    style:
                    const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const Divider(thickness: 10, color: Color(0xFF1E1E1E)),

                //Login
                const Padding(
                  padding:
                  //EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
                  child: Text(
                    "Login :",
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    controller: controllers['login'],
                    enabled: isEditing,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Login"
                    ),
                    style:
                    const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                const Divider(thickness: 10, color: Color(0xFF1E1E1E)),

                //Password
                const Padding(
                  padding:
                  //EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
                  child: Text(
                    "Password :",
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextField(
                    controller: controllers['password'],
                    enabled: isEditing,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password"
                    ),
                    style:
                    const TextStyle(fontSize: 20.0, color: Colors.white),
                    obscuringCharacter: "•",
                    obscureText: true,
                  ),

                ),
                const Divider(thickness: 10, color: Color(0xFF1E1E1E)),

              ]
          )],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          if (isEditing == true) {
            widget.password= Password(
                controllers['title']!.text,
                controllers['url']!.text,
                controllers['login']!.text,
                controllers['password']!.text
            );
            Navigator.pop(context, widget.password);
          } else {
            setState(() {
              isEditing = true;
              icon = const Icon(Icons.check);
            });
          }
        },

        child: icon,

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
