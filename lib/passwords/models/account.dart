import 'dart:io';

import 'package:hive/hive.dart';
part 'account.g.dart';

@HiveType(typeId: 1)
class Account {
  Account({required this.title, required this.login, required this.url, required this.password});
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String login;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final String password;

  @override
  String toString() {
    return 'title: $title, login: $login, url: $url, password: $password';
  }

  void main() async {
    var path = Directory.current.path;
    Hive
      ..init(path)
      ..registerAdapter(AccountAdapter());

  }
}
