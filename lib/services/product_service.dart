import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-7b73d-default-rtdb.firebaseio.com';
  final List<Product> productos = [];
  late Product productoSeleccionado;

  bool isLoading = true;
  bool isSaving = false;

  ProductService() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.productos.add(tempProduct);
    });
    this.isLoading = false;
    notifyListeners();
    return this.productos;
  }

  Future saveOrCreateProduct(Product producto) async {
    isSaving = true;
    notifyListeners();

    if (producto.id == null) {
      createProducto(producto);
    } else {
      await updateProduct(producto);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product producto) async {
    final url = Uri.https(_baseUrl, 'products/${producto.id}.json');
    final resp = await http.put(url, body: producto.toJson());
    final decodeData = resp.body;

    final index =
        this.productos.indexWhere((element) => element.id == producto.id);
    productos[index] = producto;

    return producto.id!;
  }

  Future<String> createProducto(Product producto) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: producto.toJson());
    final decodedData = json.decode(resp.body);
    producto.id = decodedData['name'];
    productos.add(producto);
    return producto.id!;
  }
}
