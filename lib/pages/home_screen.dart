import 'package:flutter/material.dart';
import 'package:store1/models/my_product.dart';
import 'package:flutter/rendering.dart';
import 'package:store1/pages/details_screen.dart';
import '../product_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Our Products",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductCategory(index: 0, name: "All Products"),
                _buildProductCategory(index: 1, name: "Jackets"),
                _buildProductCategory(index: 2, name: "Sneakers"),
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
                child: isSelected == 0
                    ? _buildAllProducts()
                :isSelected ==1
                    ?_buildJackets()
                 :_buildJSneakers(),
            ),

          ],

        ));
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index ? Colors.red : Colors.red.shade300,
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            "Product Category", style: const TextStyle(
              color: Colors.white),
          ),
        ),
      );

  _buildAllProducts() =>
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: MyProduct.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProduct.allProducts[index];
          return GestureDetector(
            onTap: () => Navigator.push (
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: allProducts),
            ),
            ),
            child: ProductCard(product: allProducts)
          );
        },
      );
  _buildJackets() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  childAspectRatio: (100/140),
  crossAxisSpacing: 12,
  mainAxisSpacing: 12),
  scrollDirection: Axis.vertical,
  itemCount: MyProduct.jacketList.length,
  itemBuilder: (context,index) {
    final jacketsList = MyProduct.jacketList[index];
    return GestureDetector(
      onTap: () =>
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(product: jacketsList,)
            ),
          ),
      child: ProductCard(product: jacketsList),
    );
  },
  );
  _buildJSneakers() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100/140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      scrollDirection: Axis.vertical,
    itemCount: MyProduct.sneakersList.length,
    itemBuilder: (context, index){
        final sneakersList = MyProduct.sneakersList[index];
        return GestureDetector(
          onTap: () =>
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: sneakersList,)
                ),
              ),
            child:ProductCard(product: sneakersList),
        );
    },
      );
}

