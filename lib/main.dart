import 'package:flutter/material.dart';
import 'package:provider_example/bloc/bloc.dart';
import 'package:provider_example/pages/signin.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/value_notify.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Provider<Bloc>(
        dispose: (_, value) => value.dispose(),
        child: ChangeNotifierProvider<ValueNotify>(
          child: SignInPage(title: 'Flutter Demo Home Page'),
          builder: (BuildContext context) => ValueNotify(),
        ),
        builder: (context) => Bloc(),
      ),
    );
  }
}
