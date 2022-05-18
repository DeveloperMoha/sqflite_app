import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_app/layouts/counterPage.dart';
import 'package:sqflite_app/shared/styles/bloc_observer.dart';

import 'layouts/home.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const Home(),
      home: const Counter(),
    );
  }
}
