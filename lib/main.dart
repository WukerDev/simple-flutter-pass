import 'package:flutter/material.dart';
import 'package:kozakowskiwiktormobile/PasswordPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'TODOList',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.red[50],
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.red[700], displayColor: Colors.blue[600])),
      // A widget which will be started on application startup
      home: const PasswordPage(),
    );
  }
}
