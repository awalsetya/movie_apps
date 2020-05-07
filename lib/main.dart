import 'package:flutter/material.dart';
import 'package:movie_apps/services/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Sign Up"),
                onPressed: () async {
                  SignInSignUpResult result = await AuthService.signUp(
                      "awal@gmail.com",
                      "123456",
                      "awal",
                      ["Action", "Horor", "Music", "Drama"],
                      "Korea");

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
              ),
              RaisedButton(
                child: Text("Sign in"),
                onPressed: () async {
                  SignInSignUpResult result = await AuthService.signIn(
                      "awal@gmail.com",
                      "123456",
                      );

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
