import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../Model.dart";

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Provider.of<Model>(context, listen:false).isLoggedIn(),
        child: Scaffold(
          appBar: AppBar(title: Text("INJIRA")),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                getUsernameField(),
                getPasswordField(),
                getSubmitButton()
              ],
            ),
          ),
        ));
  }

  Widget getUsernameField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "imeri"),
      onSaved: (val) {
        Provider.of<Model>(_formKey.currentContext, listen: false).setUsername(val);
        print("saved email ${val}");
      },
    );
  }

  Widget getPasswordField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "ijambo banga"),
      obscureText: true,
      onSaved: (val) {
        Provider.of<Model>(_formKey.currentContext, listen: false).setPassword(val);
        print("saved password ${val}");
      },
      validator: (val) {
        if (val.length <= 6) return "ijambo rigomba kuba riruta 6";
        return null;
      },
    );
  }

  Widget getSubmitButton() {
    return ElevatedButton(
      child: Text("INJIRA"),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          print("validated");
          _formKey.currentState.save();
          Navigator.pushNamed(_formKey.currentContext, "/confirmation");
        } else
          print("not validated");
      },
    );
  }
}
