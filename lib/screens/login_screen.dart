import 'package:flutter/material.dart';
import 'package:productos_app/ui/inputs_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 200),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text('Iniciar Sesión', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _LoginForm(), 
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text('Crear una cuenta nueva', style: TextStyle(fontSize: 15, color: Colors.grey)),
            ]
         )
       )
    )
   );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(hintText: 'ejemplo@correo.com', labelText: 'Correo electronico', prefixIcon: Icons.alternate_email_rounded),
              validator: ( value ){
               String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp  = new RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'El valor ingresado no es un correo';
              }
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(hintText: '********', labelText: 'Contraseña', prefixIcon: Icons.lock_rounded),
              validator: ( value ){
              if(value != null && value.length > 6){
                return null;
              }else{
                return 'La contraseña debe tener minimo 6 caracteres';
              }
              }
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child : Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text('Ingresar', style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              onPressed: (){},
              )
          ],
        ),
      )
    );
  }
}