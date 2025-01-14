import 'package:flutter/material.dart';
import 'package:store1/models/product.dart';
class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key , required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details") ,
        centerTitle: true,
      ),
      body: Column(
    children: [
      const SizedBox(height: 36),
      Row(
        mainAxisAlignment:MainAxisAlignment.center ,
            children: [
        Container(
          width: 220,
          height:220 ,
          decoration: BoxDecoration(
            shape:BoxShape.circle,
            color: Colors.red.shade100
          ),
          child: Image.asset(product.image,fit: BoxFit.cover,)
        ),
      ],
    ),
      const SizedBox(height: 36),
      Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: [
            Text(
              product.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$' '${product.price}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
      ),
            const SizedBox(height: 14,),
            Text(
              product.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 14,
              ),
            )
        ],

        ),
      )
    ],
      ),

    );
  }
}
