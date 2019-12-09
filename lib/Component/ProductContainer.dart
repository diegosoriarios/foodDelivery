import 'package:flutter/material.dart';
import 'package:food/Modelos/Produtos.dart';
import 'package:food/Pages/OrderPage.dart';
import 'package:food/Pages/RestaurantPage.dart';
import 'package:intl/intl.dart';

class ProductContainer extends StatelessWidget {
  //final String nome;
  //final String imagem;
  //final String categoria;
  Produtos produtos;
  ProductContainer({Key key, this.produtos}) : super(key: key);
  NumberFormat formater = NumberFormat("#00.00");
 
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => ExtractProductsArgumentsScreen(),
          settings: RouteSettings(arguments: ProductsArguments(produtos))
          )
        ),
        child: Container(
          height: 179,
          width: MediaQuery.of(context).size.width / 2.5,
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
              SizedBox(
                height: 9.0,
              ),
              Text(
                produtos.nome,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 9.0,
              ),
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