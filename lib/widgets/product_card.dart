import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
          margin: EdgeInsets.only(top: 30.0, bottom: 50.0),
          width: double.infinity,
          height: 400,
          decoration: _cardBorders(),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _BackGroundImage(url: product.picture),
              _ProductDetails(nombre: product.name, id: product.id!),
              Positioned(
                  top: 0, right: 0, child: _PriceTag(precio: product.price)),
              if (!product.available)
                Positioned(top: 0, left: 0, child: _NotAvailable())
            ],
          )),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 6.0),
              blurRadius: 10.0,
            )
          ]);
}

//TODO: Mostrar de manera condicional si el producto esta disponible o no
class _NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Not Available',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )),
        width: 100.0,
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        ));
  }
}

class _PriceTag extends StatelessWidget {
  final double precio;

  const _PriceTag({Key? key, required this.precio}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('\$${precio}',
                style: TextStyle(fontSize: 20.0, color: Colors.white))),
      ),
      width: 100.0,
      height: 70.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0))),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String nombre;
  final String id;

  const _ProductDetails({Key? key, required this.nombre, required this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              id,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)));
}

class _BackGroundImage extends StatelessWidget {
  final String? url;

  const _BackGroundImage({Key? key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
            ? const Image(
                image: AssetImage("assets/no-image.png"),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                image: NetworkImage(url!),
                placeholder: const AssetImage('assets/jar-loading.gif'),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
