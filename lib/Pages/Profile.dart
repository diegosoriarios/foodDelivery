import 'package:flutter/material.dart';
import 'package:food/data.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person_pin),
              title: Text("Nome"),
              subtitle: Text(usuario.nome),
              onTap: () => showInputDialog(context, "Nome", usuario.nome),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text(usuario.email),
              onTap: () => showInputDialog(context, "Email", usuario.email),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Telefone"),
              subtitle: Text(usuario.celular),
              onTap: () => showInputDialog(context, "Telefone", usuario.celular),
            ),
            ListTile(
              leading: Icon(Icons.fingerprint),
              title: Text("CPF"),
              subtitle: Text(usuario.cpf),
              onTap: () => showInputDialog(context, "CPF", usuario.cpf),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Senha"),
              subtitle: Text(usuario.senha),
              onTap: () => showInputDialog(context, "Senha", usuario.senha),
            ),
          ],
        ),
      )
    );
  }
}

showInputDialog(BuildContext context, String label, String value) { 
  TextEditingController _textFieldController = TextEditingController();

  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
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