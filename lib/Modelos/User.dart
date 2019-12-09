class User {
  String nome;
  String email;
  String celular;
  String endereco;
  String cep;
  String cpf;
  String senha;

  User(String nome, String email, String celular, String endereco, String cep, String cpf, String senha) {
    this.nome = nome;
    this.email = email;
    this.celular = celular;
    this.endereco = endereco;
    this.cep = cep;
    this.cpf = cpf;
    this.senha = senha;
  }

  void updateUser(String key, String value) {
    switch (key) {
      case "Nome":
        this.nome = value;
        break;
      case "Email":
        this.email = value;
        break;
      case "Celular":
        this.celular = value;
        break;
      case "Endereço":
        this.endereco = value;
        break;
      case "CEP":
        this.cep = value;
        break;
      case "CPF":
        this.cpf = value;
        break;
      case "Senha":
        this.senha = value;
        break;     
    }
  }
}