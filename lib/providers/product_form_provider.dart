import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Product producto;

  ProductFormProvider(this.producto);

  updateAvailability(bool value) {
    print(value);
    this.producto.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(producto.name);
    print(producto.price);
    print(producto.available);
    print(producto.id);
    return formKey.currentState?.validate() ?? false;
  }
}
