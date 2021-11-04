import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

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
            _BackGroundImage(),

            _ProductDetails(),

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag()),
            
            Positioned(
              top: 0,
              left: 0,
              child: _NotAvailable())
          ],
        )
      ),
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
    ]
  );
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
          child: Text('Not Available', style: TextStyle(color: Colors.white, fontSize: 20.0),),
          )
      ),
      width:100.0,
      height: 70.0,
      decoration : BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.only( topLeft:  Radius.circular(25), bottomRight: Radius.circular(25)),
      )
    );
  }
}

class _PriceTag extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10)
        ,child: Text('\$10,000.99', style: TextStyle(fontSize: 20.0, color: Colors.white))),
      ),
      width: 100.0,
      height: 70.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), bottomLeft: Radius.circular(25.0))
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {

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
              'Product Name', 
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
             Text(
              'Product Id', 
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
      bottomLeft: Radius.circular(25.0),
      topRight: Radius.circular(25.0)
    )
  );
}

class _BackGroundImage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}