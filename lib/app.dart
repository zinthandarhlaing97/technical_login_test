import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_login_test_prj/bloc/bloc.dart';
import 'package:technical_login_test_prj/ui/login/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: BlocProvider<AuthBloc>(
        create: (BuildContext context) => AuthBloc(),
        child: LoginPage(),
      ),
    );
  }
}
