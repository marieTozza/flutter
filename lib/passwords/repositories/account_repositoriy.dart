import 'package:hive/hive.dart';

import '../models/account.dart';

class AccountRepository {
  static List<Account> accounts = [];

  static void addAccount(Account account) {
    var box = Hive.box<Account>('Account');
    box.add(account);
  }

  static Future<void> editAccount (int index, Account account) async {
    var box = Hive.box<Account>('Account');
    await box.putAt(index, account);
  }

  static void removeAccount(int index){
    var box = Hive.box<Account>('Account');
    box.delete(index);
  }

  static Box<Account> getAccounts() {
    return Hive.box<Account>('Account');
  }

  static Future<void> fillAccounts() async {
    var box = Hive.box<Account>('Account');

    var account1 = Account(
        title: 'title1',
        login: 'login1',
        url: 'url1',
        password : 'password1'
    );

    var account2 = Account(
        title: 'title2',
        login: 'login2',
        url: 'url2',
        password : 'password2'
    );

    var account3 = Account(
        title: 'title3',
        login: 'login3',
        url: 'url3',
        password : 'password3'
    );
/*    for(int i = 0 ; i < 9 ; i++) {
      await box.deleteAt(0);

    }*/


    await box.add(account1);
    await box.add(account2);
    await box.add(account3);
  }

}