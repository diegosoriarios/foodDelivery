import 'package:flutter/material.dart';
import 'package:food/Pages/FavoritesPage.dart';
import 'package:food/Pages/RestaurantListPage.dart';
import 'Pages/Profile.dart';
import 'restaurantPage.dart';
import 'Pages/MainPage.dart';

void main() {
  runApp(MaterialApp(
    title: "Using tabs",
    home: MyHome(),
    theme: ThemeData(
      primarySwatch: Colors.orange,
      fontFamily: 'Montserrat',
    ),
    routes: {
      ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      'profile': (ctx) => Profile()
    },
  ));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: TabBarView(
        children: <Widget>[MyApp(), RestaurantListPage(), FavoritesPage(), Profile()],
        controller: controller,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
        color: Colors.white,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home, color: Colors.black),
            ),
            Tab(
              icon: Icon(Icons.list, color: Colors.black),
            ),
            Tab(
              icon: Icon(Icons.favorite_border, color: Colors.black),
            ),
            Tab(
              icon: Icon(Icons.person_outline, color: Colors.black),
            )
          ],
          controller: controller,
        ),
      ),
    );
  }
}