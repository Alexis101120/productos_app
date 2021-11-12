import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productService.productos.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: ProductCard(
            product: productService.productos[index],
          ),
          onTap: () {
            productService.productoSeleccionado =
                productService.productos[index].copy();
            Navigator.pushNamed(context, 'product');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productService.productoSeleccionado =
              Product(available: false, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
