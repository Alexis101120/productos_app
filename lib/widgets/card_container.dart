import 'dart:ffi';

import 'package:flutter/material.dart';


class CardContainer extends StatelessWidget {

  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        decoration: _createCardShape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 5),
        blurRadius: 10,
      ),
    ],
  );
}