import 'package:food/Modelos/Produtos.dart';
import 'package:food/Modelos/Restaurant.dart';
import 'package:food/Modelos/User.dart';

List<String> buttonsTitle = ["All", "Popular", "Dessert", "Snack", "Fast Food"];
/*List<String> restaurantList = [
  "American Restaurant",
  "Turkish Restaurant",
  "Indian Restaurant",
  "Japanese Restaurant"
];*/

List<Produtos> japones = [
  Produtos("Sushi", "assets/imgs/lobster.jpg", 40.0, ["Salmao", "Arroz"]),
  Produtos("Sashimi", "assets/imgs/lobster.jpg", 45.0, ["Salmao"]),
  Produtos("Yakisoba", "assets/imgs/lobster.jpg", 50.0, ["Lamen", "Carne", "Cenoura", "Couve-Flor"])
];

List<Produtos> americano = [
  Produtos("Hamburguer", "assets/imgs/meat.jpg", 40.0, ["Hamburguer"]),
  Produtos("Batata Frita", "assets/imgs/meat.jpg", 40.0, ["Batata Frita"]),
];

List<Restaurante> restaurantList = [
  Restaurante("American Restaurant", "assets/imgs/meat.jpg", "Fast Food", []),
  Restaurante("Turkish Restaurant", "assets/imgs/meat.jpg", "Fast Food", []),
  Restaurante("Indian Restaurant", "assets/imgs/meat.jpg", "Popular", []),
  Restaurante("Japanese Restaurant", "assets/imgs/meat.jpg", "Japanese", japones),
];

List<Restaurante> favoritos = [];

User usuario = User("Diego Soria Rios", 'diegosoriarios@gmail.com', "54 991907331", "Rua Fagundes dos Reis 220", "99010070", "", "123456");