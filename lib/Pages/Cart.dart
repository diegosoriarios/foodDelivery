import 'package:flutter/material.dart';
import 'package:food/Component/ProductContainer.dart';
import 'package:food/Modelos/Produtos.dart';
import 'package:food/Modelos/Restaurant.dart';
import 'package:food/Pages/MainPage.dart';
import 'package:food/data.dart';
import 'package:intl/intl.dart';

class Cart extends StatelessWidget {
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
      body: cart.length != 0 ? cartItems() : emptyCart()
    );
  }
}

Widget emptyCart() => (
  Center(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/imgs/empty_chart.png"),
          ),
          Text(
            "Seu carrinho está vazio",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Adicione algum pedido e veja aqui"
          )
        ]
      )
    ),
  )
);

Widget cartItems() => (
  GridView.count(
    crossAxisCount: 2,
    children: List.generate(cart.length, (index) {
      return Center(
        child: GridListItem(produtos: cart[index],)
      );
    }),
  )
);

class GridListItem extends StatelessWidget {
  const GridListItem({Key key, this.produtos}) : super(key: key);
  final Produtos produtos;

  @override
  Widget build(BuildContext context) {
    NumberFormat formater = NumberFormat("#00.00");
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, 'pagamento'),
        child: Container(
          //height: 179,
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .35,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0, 3),
                color: Colors.grey[300],
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: Image.asset(produtos.imagem),
                borderRadius: BorderRadius.circular(15.0),
              ),
              Spacer(),
              Text(
                produtos.nome,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "5.0",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "R\$ " + formater.format(produtos.preco).toString(),
                    style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}