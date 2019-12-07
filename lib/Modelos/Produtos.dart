class Produtos {
  String nome;
  double preco;
  String imagem;
  List<String> ingredientes;

  Produtos(String nome, String imagem, double preco, List<String> ingredientes) {
    this.nome = nome;
    this.imagem = imagem;
    this.preco = preco;
    this.ingredientes = ingredientes;
  }
}