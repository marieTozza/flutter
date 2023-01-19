import 'package:flutter/material.dart';

import 'models/account.dart';

class AddOrEditAccount extends StatefulWidget {
  Account account;
  int  index;
  bool isEditing;
  AddOrEditAccount({super.key, required this.index, required this.account, required this.isEditing});
  @override
  State<AddOrEditAccount> createState() => _AddOrEditAccountState();
}

class _AddOrEditAccountState extends State<AddOrEditAccount> {
  late Icon icon;

  @override
  Widget build(BuildContext context) {
    if(widget.isEditing == true){
      icon = const Icon(Icons.check);
    } else {
      icon = const Icon(Icons.edit);
    }
    var controllers = {
      "title": TextEditingController(text: widget.account.title),
      "url": TextEditingController(text: widget.account.url),
      "login": TextEditingController(text: widget.account.login),
      "password": TextEditingController(text: widget.account.password),
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
                    enabled: widget.isEditing,
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
                    enabled: widget.isEditing,
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
                    enabled: widget.isEditing,
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
                    enabled: widget.isEditing,
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
          if (widget.isEditing == true) {
            widget.account = Account(
                title: controllers['title']!.text,
                login: controllers['url']!.text,
                url: controllers['login']!.text,
                password: controllers['password']!.text
            );
            Navigator.pop(context, widget.account);
          } else {
            setState(() {
              widget.isEditing = true;
              icon = const Icon(Icons.check);
            });
          }
        },

        child: icon,

      ),
    );
  }
}
