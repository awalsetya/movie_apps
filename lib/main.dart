import 'package:flutter/material.dart';
import 'package:movie_apps/services/services.dart';
import 'package:provider/provider.dart';

import 'ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper()
      ),
    );
  }
}
