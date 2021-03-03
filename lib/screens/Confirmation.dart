import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:itike_qr/Model.dart";

class ConfirmationScreen extends StatelessWidget{
  var context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(title: Text("CONFIRMATION")),
      body: Column(
        children: [
          getText(), getInputField(), getSubmitButton()
        ],
      ),
    );
  }

  Widget getText(){
    final name = Provider.of<Model>(context, listen: false).username;
    return Text("Nyakubahwa $name, mushyiremo kode mwoherejwe juri imeri");
  }

  Widget getInputField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "kode"
      ),
    );
  }

  Widget getSubmitButton(){
    return ElevatedButton(
      child: Text("Suzuma"),
      onPressed: (){},
    );
  }


}