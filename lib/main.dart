import 'package:flutter/material.dart';
import 'package:food/Pages/CreateProductPage.dart';
import 'package:food/Pages/FavoritesPage.dart';
import 'package:food/Pages/RestaurantListPage.dart';
import 'package:food/Pages/Profile.dart';
import 'package:food/Pages/RestaurantPage.dart';
import 'package:food/Pages/MainPage.dart';
import 'package:food/Pages/Login.dart';
import 'package:food/Pages/Splashscreen.dart';

import 'data.dart';

void main() {
  runApp(MaterialApp(
    title: "Using tabs",
    //home: MyHome(),
    //home: LoginScreen(),
    home: Splash(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange,
      fontFamily: 'Montserrat',
    ),
    routes: {
      ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      'profile': (ctx) => Profile(),
      'newProduct': (ctx) => CreateProductPage(),
      'home': (ctx) => MyHome(),
      'open': (ctx) {
        if(userIsLogged) {
          return MyHome();
        } else {
          return LoginScreen();
        }
      }
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

  Widget _renderFloatingActionButton() {
    if (usuario.permissao == "restaurante") {
      return FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pushNamed(context, 'newProduct'),
      );
    } else return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _renderFloatingActionButton(),
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