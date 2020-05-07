part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('user');

  static Future<void> updateUser(User user) async {
    // String genres = "";

    // for (var genre in user.selectedGenres) {
    //   genres += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    // }

    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilPicture ?? "",
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return User(
      id,
      snapshot.data['email'],
      balance: snapshot.data['balance'],
      profilPicture: snapshot.data['profilPicture'],
      selectedGenres: (snapshot.data['selectedGenres'] as List).map((e)=> e.toString()).toList(),
      selectedLanguage: snapshot.data['selectedLanguage'],
      name: snapshot.data['name'],
    );
  }
}
