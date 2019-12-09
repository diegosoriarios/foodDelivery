import 'package:food/Modelos/Produtos.dart';

class Pedidos {
  DateTime pedido;
  List<Produtos> produtos;

  Pedidos(DateTime pedido, List<Produtos> produtos) {
    this.pedido = pedido;
    this.produtos = produtos;
  }
}