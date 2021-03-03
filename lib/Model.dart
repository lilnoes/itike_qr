import "package:flutter/material.dart";

class Model extends ChangeNotifier {
  var username = "";
  var password = "";
  bool loggedIn = false;

  void setUsername(String username) {
    this.username = username;
    print("new username "+username);
    notifyListeners();
  }

  void setPassword(String password) {
    this.password= password;
        print("new password "+password);
    notifyListeners();
  }
  Future<bool> isLoggedIn() async{
    if(username=="lilnoes" && password=="ishimwe1") loggedIn=true;
    return loggedIn;
  }
}