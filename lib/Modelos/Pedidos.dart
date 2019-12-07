import 'package:food/Modelos/Produtos.dart';

class Pedidos {
  DateTime pedido;
  List<Produtos> produto;

  Pedidos(DateTime pedido, List<Produtos> produto) {
    this.pedido = pedido;
    this.produto = produto;
  }
}