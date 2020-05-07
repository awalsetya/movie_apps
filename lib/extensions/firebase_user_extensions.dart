part of 'extensions.dart';

extension FirebaseExtension on FirebaseUser {
  User convertToUser(
          {String name ="No name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      User(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);
}
