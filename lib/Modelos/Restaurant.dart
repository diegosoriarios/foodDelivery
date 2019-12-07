import 'package:food/Modelos/Produtos.dart';

class Restaurante {
  String nome;
  String imagem;
  String categoria;
  List<Produtos> produtos;

  Restaurante(String nome, String imagem, String categoria, List<Produtos> produtos) {
    this.nome = nome;
    this.imagem = imagem;
    this.categoria = categoria;
    this.produtos = produtos;
  }
}