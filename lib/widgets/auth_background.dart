import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
            _PurpleBox(),
           
        ],)
    );
  }
}


class _PurpleBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,  
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: _Bubble(),
          ),
          Positioned(
            top: -40,
            left: -30,
            child: _Bubble(),
          ),
           Positioned(
            top: -50,
            left: -20,
            child: _Bubble(),
          ),
           Positioned(
            bottom: -50,
            right: -20,
            child: _Bubble(),
          ),
            Positioned(
            bottom: 120,
            right: 20,
            child: _Bubble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient:LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ])
  );
}

class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width:100,
      height:100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}