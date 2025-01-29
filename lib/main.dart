import 'package:flutter/material.dart';
import 'package:store1/pages/Profile_screen.dart';
import 'package:store1/pages/cart_screen.dart';
import 'package:store1/pages/details_screen.dart';
import 'package:store1/pages/favorite_screen.dart';
import 'package:store1/pages/home_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) { MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ],
    child: MaterialApp(
      title: "E - Commerce  Shop",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const HomePage(),
    ),
  );
    return const Placeholder();
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List screens =[
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E - Commerce Shop"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: ()=> Navigator.push (
              context,
              MaterialPageRoute(builder: (context) =>const CartScreen()
              )
            ),
            icon: const Icon(Icons.add_shopping_cart),
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          setState(() =>currentIndex = value);},
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items:const [
          BottomNavigationBarItem(
            label:  "Home",
            icon:  Icon(Icons. home),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon:  Icon (Icons. person),
          )
        ],
      ),

    );
  }
}
