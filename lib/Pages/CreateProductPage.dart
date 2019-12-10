import 'package:flutter/material.dart';
import 'package:food/data.dart';

class CreateProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(favoritos.length, (index) {
          return Center(
            child: Text("Novo")
          );
        }),
      )
    );
  }
}