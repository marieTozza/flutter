
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/passwords/repositories/account_repositoriy.dart';
import 'add_or_edit_page.dart';
import 'models/account.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});

  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

   final _accounts = AccountRepository.getAccounts();

   @override
   void dispose() {
     Hive.box<Account>('Account').close();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFBEBEBE),
          title: Center(
              child: Text(
                  style: const TextStyle(color: Color(0xFF1E1E1E)),
                  widget.title))),
      body: ValueListenableBuilder<Box<Account>>(
        valueListenable: Hive.box<Account>('Account').listenable(),
        builder: (context, box, _) {
          final accounts = box.values.toList().cast<Account>();
          return Container(
            color: const Color(0xFF1E1E1E),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _accounts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () async {
                                final Account? account = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddOrEditAccount(index: index, account: accounts[index], isEditing: false,),
                                    )) ;
                                setState(() {
                                  if (account != null) {
                                    AccountRepository.editAccount(index, account);
                                  }
                                });
                              },
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        accounts[index].title,
                                        style: const TextStyle(
                                          color: Color(0xFFBEBEBE),
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    const Divider(color: Colors.white, thickness: 1),
                                  ]));
                        }))
              ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        final account = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddOrEditAccount(index: 0, account: Account(title: "",login: "", url: "", password: ""), isEditing: true),
            )) ;
        if (account != null) {
          setState(() {
            AccountRepository.addAccount(account);
          });
        }
          setState(() {

          });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DetailsPage(account: Password("nouveau","","","")),
          //   ));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}