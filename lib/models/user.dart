part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilPicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  User(this.id, this.email, {this.name,this.profilPicture, this.selectedGenres, this.selectedLanguage, this.balance});


  @override
  // TODO: implement props
  List<Object> get props => [
    id,
    email,
    profilPicture,
    selectedGenres,
    selectedLanguage,
    balance,
  ];
  }