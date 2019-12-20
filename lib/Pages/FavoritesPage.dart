import 'package:flutter/material.dart';
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
          "Favoritos",
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17
          ),
        ),
      ),
      body: favoritos.length != 0 ? showFavorite() : favoriteEmpty()
    );
  }
}

Widget showFavorite() => (
  GridView.count(
    crossAxisCount: 2,
    children: List.generate(favoritos.length, (index) {
      return Center(
        child: SmallContainer(restaurante: favoritos[index],)
      );
    }),
  )
);

Widget favoriteEmpty() => (
  Center(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/imgs/smiley_-_sad.png"),
          ),
          Text(
            "Voce não tem nenhum restaurante favorito ainda...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ]
      )
    ),
  )
);