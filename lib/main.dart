import 'package:flutter/material.dart';
import 'package:store1/pages/Profile_screen.dart';
import 'package:store1/pages/favorite_screen.dart';
import 'package:store1/pages/home_screen.dart';

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
          ),

        ],
      ),

    );
  }
}
