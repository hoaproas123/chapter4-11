import 'package:flutter/material.dart';
class appbarChild extends StatelessWidget {

  final String tittle;
  const appbarChild({required this.tittle});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(tittle),
      centerTitle: true,
      backgroundColor: Colors.greenAccent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}