import 'package:flutter/material.dart';
import 'package:productos_app/screens/home_screen.dart';
import 'package:productos_app/screens/login_screen.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
          child: FutureBuilder(
              future: authService.readToken(),
              builder: (BuildContext context, AsyncSnapshot<String> spnapShot) {
                if (!spnapShot.hasData) {
                  return CircularProgressIndicator();
                }

                if (spnapShot.data == '') {
                  Future.microtask(() {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, ___, ____) => LoginScreen(),
                            transitionDuration: Duration(seconds: 0)));
                    //Navigator.of(context).pushReplacementNamed('login');
                  });
                } else {
                  Future.microtask(() {
                    //Navigator.of(context).pushReplacementNamed('home');
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, ___, ____) => HomeScreen(),
                            transitionDuration: Duration(seconds: 0)));
                  });
                }

                return Container();
              })),
    );
  }
}
