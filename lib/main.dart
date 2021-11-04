import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'login' : (_) => LoginScreen(),
        'home' : (_) => HomeScreen(),
        'product' : (_) => ProductScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    );
  }
}