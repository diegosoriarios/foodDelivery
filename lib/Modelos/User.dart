class User {
  String nome;
  String email;
  String celular;
  String endereco;
  String cep;
  String cpf;
  String senha;
  String permissao;

  User(String nome, String email, String celular, String endereco, String cep, String cpf, String senha, String permissao) {
    this.nome = nome;
    this.email = email;
    this.celular = celular;
    this.endereco = endereco;
    this.cep = cep;
    this.cpf = cpf;
    this.senha = senha;
    this.permissao = permissao;
  }
}