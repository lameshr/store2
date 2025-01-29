import 'package:flutter/material.dart';
import '../providers/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider =FavoriteProvider.of(context);
    final finalList = provider.favorites;

    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: const [
              Text("Favorites",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                  itemBuilder:(context,index){
                  return Padding(padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(finalList[index].name,
                    style: const TextStyle(
                      fontSize:20, fontWeight:FontWeight.bold
                    ),
                    ),
                    subtitle: Text(finalList[index].description,
                    overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(finalList[index].image,),
                      backgroundColor: Colors.red.shade100,
                    ),
                    trailing: Text('\$${finalList[index].price}',
                    style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,),
                    ),
                    tileColor: Colors.white,
                  ),
          );
                },
                ),
          ),
        ],
      )
    );
  }
}
