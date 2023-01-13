
import 'package:flutter/material.dart';
import 'package:my_app/passwords/repositories/password_repositoriy.dart';

import 'new_password.dart';
import 'models/password.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});

  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
   final List<Password> _passwords = PasswordRepository.getPasswords();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFBEBEBE),
          title: Center(
              child: Text(
                  style: const TextStyle(color: Color(0xFF1E1E1E)),
                  widget.title))),
      body: Container(
        color: const Color(0xFF1E1E1E),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Expanded(
                child: Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _passwords.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () async {
                              final Password? password = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewPassword(password: _passwords[index], isEditing: false,),
                                  )) ;
                              setState(() {
                                if (password != null) {
                                  PasswordRepository.editPassword(index, password);
                                }
                                // _passwords[index] = password;
                              });
                            },
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      _passwords[index].title,
                                      style: const TextStyle(
                                        color: Color(0xFFBEBEBE),
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  const Divider(color: Colors.white, thickness: 1),
                                ]));
                      }),
                ))
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        final password = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPassword(password: Password("","","",""), isEditing: true),
            )) ;
        if (password != null) {
          setState(() {
            PasswordRepository.addPassword(password);
          });
        }
          setState(() {

          });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DetailsPage(password: Password("nouveau","","","")),
          //   ));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}