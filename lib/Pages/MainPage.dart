import 'package:flutter/material.dart';
import 'package:food/Pages/RestaurantPage.dart';
import 'package:food/starDisplay.dart';
import 'package:food/Pages/Profile.dart';
import 'package:food/Modelos/Restaurant.dart';
import 'package:food/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Montserrat',
      ),
      home: Home(),
      routes: {
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
        'profile': (ctx) => Profile()
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> {
  static final date = new DateTime.now();
  String currentDay = date.day.toString() + "/" + date.month.toString() + "/" + date.year.toString();
  List<Restaurante> lista;
  int _active = 0;

  @override
  void initState() {
    super.initState();
    lista = restaurantList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () => Navigator.pushNamed(context, 'profile'),
            ),
          ],
        ),
      ),*/
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(currentDay),
                          Text(
                            "O que você gostaria de comer hoje?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/imgs/profile.jpg"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for a dish",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 275,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, id) {
                      return LargeContainer();
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey[100]),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.symmetric(horizontal: 9.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                              colors: [Colors.orangeAccent, Colors.pinkAccent]),
                        ),
                        child: Text(
                          "Sale",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "# Gourmet food in summer",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                //CategoriesList(),
                Container(
                  height: 55,
                  child: ListView.builder(
                    itemCount: buttonsTitle.length,
                    itemBuilder: (BuildContext context, int id) {
                      return MyCustomButton(
                        title: buttonsTitle[id],
                        active: id == _active ? true : false,
                        onTap: () {
                          setState(() {
                            _active = id;
                            lista = updateList(id);
                          });
                        },
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 15.0),
                //CategoriesItem(),
                Container(
                  height: 181,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: lista.length,
                    itemBuilder: (context, id) {
                      return SmallContainer(restaurante: lista[id],);
                    },
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  List<Restaurante> updateList(_active) {
    if (buttonsTitle[_active] == "Todos") {
      return restaurantList;
    } else {
      return restaurantList.where((i) => i.categoria == buttonsTitle[_active]).toList();
    }
  }
}

class LargeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'restaurant'),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
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
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              child: Image.asset("assets/imgs/lobster.jpg"),
              borderRadius: BorderRadius.circular(15.0),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              "Australian Lobster stewed rice",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            SizedBox(
              height: 9.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.pin_drop,
                  color: Colors.grey[400],
                ),
                Text(
                  "3KM Until Arrival",
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 3,
                  child: FittedBox(
                    child: StarDisplay(
                      value: 4,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SmallContainer extends StatelessWidget {
  //final String nome;
  //final String imagem;
  //final String categoria;
  Restaurante restaurante;
  SmallContainer({Key key, this.restaurante}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => ExtractArgumentsScreen(),
          settings: RouteSettings(arguments: ScreenArguments(restaurante))
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
                child: Image.asset(restaurante.imagem),
                borderRadius: BorderRadius.circular(15.0),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                restaurante.nome,
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
                  Icon(
                    Icons.favorite,
                    color: Colors.grey[400],
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

class MyCustomButton extends StatelessWidget {
  final bool active;
  final String title;
  final onTap;
  const MyCustomButton({Key key, this.active, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 115,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: !active ? Border.all(color: Colors.grey[100]) : null,
            borderRadius: BorderRadius.circular(21.0),
            gradient: active
                ? LinearGradient(colors: [Colors.yellow, Colors.orange])
                : null,
            color: active ? null : Colors.white,
            boxShadow: [
              active
                  ? BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(0, 3),
                      blurRadius: 5.0,
                    )
                  : BoxShadow()
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
          child: Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _active = 0;
  
  @override
  void initState() {
    super.initState();
    favoritos = restaurantList;
  }
  

  @override
  Widget build(BuildContext context) {
    print(favoritos);
    return Container(
      height: 55,
      child: ListView.builder(
        itemCount: buttonsTitle.length,
        itemBuilder: (BuildContext context, int id) {
          return MyCustomButton(
            title: buttonsTitle[id],
            active: id == _active ? true : false,
            onTap: () {
              setState(() {
                _active = id;
                favoritos = restaurantList.where((i) => i.categoria == buttonsTitle[_active]).toList();
              });
            },
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}