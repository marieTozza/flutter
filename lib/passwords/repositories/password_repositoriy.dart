import '../models/password.dart';

class PasswordRepository {
  static List<Password> passwords = [
    Password("oui","oui","oui","oui"),
    Password("non","non","non","non"),
    Password("toto","toto","toto","toto")
  ];

  static void addPassword(Password password) {
    passwords.add(password);
  }

  static void editPassword(int index, Password password) {
    passwords[index] = password;
  }

  static List<Password> getPasswords() {
    return passwords;
  }


}