import 'package:flutter/material.dart';
import 'package:food/Modelos/Produtos.dart';
import 'package:food/Pages/MainPage.dart';
import 'package:food/starDisplay.dart';
import 'package:food/Modelos/Restaurant.dart';
import 'package:food/Component/RoundButton.dart';
import 'package:food/data.dart';
import 'package:food/Component/ProductContainer.dart';

class ProductsArguments {
  final Produtos produtos;

  ProductsArguments(this.produtos);
}

class ExtractProductsArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ProductsArguments args = ModalRoute.of(context).settings.arguments;
    
    List<Widget> list = new List<Widget>();
    Produtos item = args.produtos;
    
    for(var i = 0; i < item.ingredientes.length; i++){
      list.add(
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
              Text(item.ingredientes[i],  style: TextStyle( fontWeight: FontWeight.w500, fontSize: 20)),
              //Text(item[i].preco.toString(),  style: TextStyle( fontWeight: FontWeight.w500, fontSize: 20)),
          ],
          
        )
      );
    }


    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(args.produtos.imagem),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RoundButton(icon: Icons.arrow_back_ios, onTap: (){Navigator.pop(context);},),
                      Spacer(),
                      //RoundButton(icon: Icons.favorite_border, onTap: () {favoritos.add(args.restaurante);},),
                      SizedBox(width: 5.0),
                      RoundButton(icon: Icons.ac_unit),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 51),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Text(
                      "\$125",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.pin_drop,
                          color: Colors.grey[400],
                        ),
                        Text(
                          "3KM Until Arrival",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      args.produtos.nome,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
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
                          width: 11,
                        ),
                        Text(
                          "5.0",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        StarDisplay(
                          value: 5,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/imgs/profile.jpg'),
                        ),
                        SizedBox(width: 11),
                        Text(
                          "Amazigh",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 21),
                        Text(
                          "22:30",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Spacer(),
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "59",
                          style: TextStyle(color: Colors.pink),
                        ),
                        SizedBox(width: 11),
                        Icon(
                          Icons.comment,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "129",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    
                    /**
                     * INGREDIENTES
                     */
                    /*
                    Text("Pratos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    SingleChildScrollView(
                      child: Column(
                        children: list
                      ),
                    ),*/
                    SizedBox(height: 15.0),
                    Container(
                      height: 181,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: args.produtos.ingredientes.length,
                        itemBuilder: (context, id) {
                          return Text(args.produtos.ingredientes[id],);
                        },
                      ),
                    ),


                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                            ),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, color: Colors.orange)
                            ]),
                        child: GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Spacer(),
                              Text(
                                "Adicionar ao Carrinho",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold, fontSize: 21
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ]
                          ),
                          onTap: (() {
                            cart.add(item);
                            Navigator.pop(context);
                            print(cart);
                          }), 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildList() => ListView(
      children: [
        _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '3117 16th St', Icons.theaters),
        _tile('United Artists Stonestown Twin', '501 Buckingham Way',
            Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        Divider(),
        _tile('Kescaped_code#39;s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _tile('Emmyescaped_code#39;s Restaurant', '1923 Ocean Ave', Icons.restaurant),
        _tile(
            'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
        _tile('La Ciccia', '291 30th St', Icons.restaurant),
      ],
    );

ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
      title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );