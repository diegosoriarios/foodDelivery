import 'package:flutter/material.dart';

class Pagamento extends StatefulWidget {
  @override
  _PagamentoScreenState createState() => _PagamentoScreenState();
}
 
class _PagamentoScreenState extends State<Pagamento> {
 
  /// NEW CODE.
  @override
  void initState() {
    super.initState();

  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
        child: Center(
          child: Container(
          width: 150,
          height: 150,
          child: Image.asset("assets/tick.png"),
        ),
      )
    );
  }
}