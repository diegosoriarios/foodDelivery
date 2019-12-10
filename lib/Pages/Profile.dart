import 'package:flutter/material.dart';
import 'package:food/Modelos/User.dart';
import 'package:food/data.dart';


class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User meuUsuario = usuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person_pin),
              title: Text("Nome"),
              subtitle: Text(meuUsuario.nome),
              onTap: () => showInputDialog(context, "Nome", meuUsuario.nome),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text(meuUsuario.email),
              onTap: () => showInputDialog(context, "Email", meuUsuario.email),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Telefone"),
              subtitle: Text(meuUsuario.celular),
              onTap: () => showInputDialog(context, "Telefone", meuUsuario.celular),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Endereço"),
              subtitle: Text(meuUsuario.endereco),
              onTap: () => showInputDialog(context, "Endereço", meuUsuario.endereco),
            ),
            ListTile(
              leading: Icon(Icons.markunread_mailbox),
              title: Text("CEP"),
              subtitle: Text(meuUsuario.cep),
              onTap: () => showInputDialog(context, "CEP", meuUsuario.cep),
            ),
            ListTile(
              leading: Icon(Icons.fingerprint),
              title: Text("CPF"),
              subtitle: Text(meuUsuario.cpf),
              onTap: () => showInputDialog(context, "CPF", meuUsuario.cpf),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Senha"),
              subtitle: Text(meuUsuario.senha),
              onTap: () => showInputDialog(context, "Senha", meuUsuario.senha),
            ),
          ],
        ),
      )
    );
  }
  
  void updateUser(String key, String value) {
    switch (key) {
      case "Nome":
        meuUsuario.nome = value;
        break;
      case "Email":
        meuUsuario.email = value;
        break;
      case "Celular":
        meuUsuario.celular = value;
        break;
      case "Endereço":
        meuUsuario.endereco = value;
        break;
      case "CEP":
        meuUsuario.cep = value;
        break;
      case "CPF":
        meuUsuario.cpf = value;
        break;
      case "Senha":
        meuUsuario.senha = value;
        break;     
    }
  } 

  showInputDialog(BuildContext context, String label, String value) { 
    TextEditingController _textFieldController = TextEditingController();

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => {
        updateUser(label, _textFieldController.text),
        setState(() {
          usuario = meuUsuario;
        }),
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