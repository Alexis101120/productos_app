import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/inputs_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.productoSeleccionado),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage(
                      url: productService.productoSeleccionado.picture),
                  Positioned(
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.white)),
                    top: 60,
                    left: 20,
                  ),
                  Positioned(
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.camera_alt_outlined,
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
          onPressed: () async {
            if (!productForm.isValidForm()) return;
            await productService.saveOrCreateProduct(productForm.producto);
            Navigator.pop(context);
          },
        ));
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.producto;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Form(
              key: productForm.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: product.name,
                    validator: (value) {
                      if (value == null || value.length < 1) {
                        return 'El nombre es obligatorio';
                      }
                    },
                    onChanged: (value) => product.name = value,
                    decoration: InputDecorations.authInputDecoration(
                        hintText: 'Nombre del producto', labelText: 'Nombre:'),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    initialValue: '${product.price}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    validator: (value) {
                      if (double.tryParse(value!) == null) {
                        product.price = 0;
                      } else {
                        product.price = double.parse(value);
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecorations.authInputDecoration(
                        hintText: '\$0.00', labelText: 'Precio:'),
                  ),
                  SizedBox(height: 30),
                  SwitchListTile.adaptive(
                      value: product.available,
                      activeColor: Colors.indigo,
                      title: const Text('Disponible'),
                      onChanged: (value) {
                        productForm.updateAvailability(value);
                      }),
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
