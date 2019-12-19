import 'package:flutter/material.dart';
import 'package:food/Modelos/Restaurant.dart';
import 'package:food/Pages/MainPage.dart';
import 'package:food/data.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new Container(),
        title: Text(
          "Favoritos",
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(favoritos.length, (index) {
          return Center(
            child: GridListItem(restaurante: favoritos[index],)
          );
        }),
      )
    );
  }
}

class GridListItem extends StatelessWidget {
  const GridListItem({Key key, this.restaurante}) : super(key: key);
  final Restaurante restaurante;

  @override
  Widget build(BuildContext context) {
    return SmallContainer(restaurante: restaurante,);
  }
}