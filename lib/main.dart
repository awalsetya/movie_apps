import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_apps/bloc/blocs.dart';
import 'package:movie_apps/services/services.dart';
import 'package:provider/provider.dart';

import 'bloc/blocs.dart';
import 'ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_)=>PageBloc())
            ],
                      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper()
      ),
          ),
    );
  }
}
