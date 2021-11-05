import 'package:flutter/material.dart';
import 'package:productos_app/ui/inputs_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage(),
                  Positioned(
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_ios_new,
                            color: Colors.white)),
                    top: 60,
                    left: 20,
                  ),
                  Positioned(
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.camera_alt_outlined,
                            color: Colors.white)),
                    top: 60,
                    right: 20,
                  ),
                ],
              ),
              _ProductForm(),
              const SizedBox(height: 100)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save_outlined),
          onPressed: () {},
        ));
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Form(
              child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Nombre del producto', labelText: 'Nombre:'),
              ),
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '\$0.00', labelText: 'Precio:'),
              ),
              SizedBox(height: 30),
              SwitchListTile.adaptive(
                  value: true,
                  activeColor: Colors.indigo,
                  title: const Text('Disponible'),
                  onChanged: (value) {}),
              SizedBox(height: 30),
            ],
          ))),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5)
          ]);
}
