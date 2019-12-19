import 'package:flutter/material.dart';
import 'package:food/Component/ProductContainer.dart';
import 'package:food/Modelos/Produtos.dart';
import 'package:food/Modelos/Restaurant.dart';
import 'package:food/Pages/MainPage.dart';
import 'package:food/data.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new Container(),
        title: Text(
          "Carrinho",
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(cart.length, (index) {
          return Center(
            child: GridListItem(produtos: cart[index],)
          );
        }),
      )
    );
  }
}

class GridListItem extends StatelessWidget {
  const GridListItem({Key key, this.produtos}) : super(key: key);
  final Produtos produtos;

  @override
  Widget build(BuildContext context) {
    return ProductContainer(produtos: produtos,);
  }
}