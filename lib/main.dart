import "package:flutter/material.dart";
import "package:faker/faker.dart";
import 'package:provider/provider.dart';
import "screens/Camera.dart";
import "screens/Confirmation.dart";
import "screens/Home.dart";
import "screens/Login.dart";
import "screens/User.dart";
import "Model.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Model>(
        create: (context) => Model(),
        child: MaterialApp(
          title: "Itike Driver",
          initialRoute: "/login",
          routes: {
            "/": (context) => HomeScreen(),
            "/camera": (context) => CameraScreen(),
            "/confirmation": (context) => ConfirmationScreen(),
            "/login": (context) => LoginScreen(),
            "/user": (context) => UserScreen(),
          },
        ));
  }
}
