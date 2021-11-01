import 'package:flutter/material.dart';


class InputDecorations {
  static InputDecoration authInputDecoration(){
    return InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  
                ),
                hintText: 'Correo electrónico',
                labelText: 'Correo',
                labelStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.alternate_email_sharp, color: Colors.deepPurple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              );
  }
}