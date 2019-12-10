import 'package:flutter/material.dart';
import 'package:food/Modelos/Produtos.dart';
import 'package:food/data.dart';

class CreateProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewProductPage();
}

class _NewProductPage extends State<CreateProductPage> {
  //Produtos produto = new Produtos(nome, imagem, preco, ingredientes);

  String nome;
  String imagem;
  double preco;
  List<String> ingredientes;

  @override
  void initState() {
    super.initState();

    nome = "";
    imagem = "";
    preco = 0.00;
    ingredientes = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person_pin),
              title: Text("Nome"),
              subtitle: Text("meuUsuario.nome"),
              onTap: () => showInputDialog(context, "Nome", "meuUsuario.nome"),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("meuUsuario.email"),
              onTap: () => showInputDialog(context, "Email", "meuUsuario.email"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Telefone"),
              subtitle: Text("meuUsuario.celular"),
              onTap: () => showInputDialog(context, "Telefone", "meuUsuario.celular"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Endereço"),
              subtitle: Text("meuUsuario.endereco"),
              onTap: () => showInputDialog(context, "Endereço", "meuUsuario.endereco"),
            ),
            ListTile(
              leading: Icon(Icons.markunread_mailbox),
              title: Text("CEP"),
              subtitle: Text("meuUsuario.cep"),
              onTap: () => showInputDialog(context, "CEP", "meuUsuario.cep"),
            ),
            ListTile(
              leading: Icon(Icons.fingerprint),
              title: Text("CPF"),
              subtitle: Text("meuUsuario.cpf"),
              onTap: () => showInputDialog(context, "CPF", "meuUsuario.cpf"),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Senha"),
              subtitle: Text("meuUsuario.senha"),
              onTap: () => showInputDialog(context, "Senha", "meuUsuario.senha"),
            ),
          ],
        ),
      )
    );
  }
  
  
  showInputDialog(BuildContext context, String label, String value) { 
    TextEditingController _textFieldController = TextEditingController();

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => {
        print(_textFieldController.text),
        Navigator.of(context).pop()
      }
    );

    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () => Navigator.of(context).pop(),
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text(label),
      content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(hintText: value),
      ),
      actions: [
        okButton,
        cancelButton
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}