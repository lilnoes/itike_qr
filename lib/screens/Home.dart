import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../Model.dart";

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME")),
      body: Center(child: Text("Home"),),
    );
  }


}