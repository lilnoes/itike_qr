import "package:flutter/material.dart";
import "package:faker/faker.dart";
import 'package:provider/provider.dart';

class MyModel extends ChangeNotifier {
  var count = 0;
  void setCount(int number) {
    this.count = number;
    print("changed to $count");
    notifyListeners();
  }

  void increment() {
    print(this.count);
    notifyListeners();
    this.count++;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Random Words",
      home: ChangeNotifierProvider<MyModel>(
        create: (context) => MyModel(),
        child: RandomName(),
      ),
    );
  }
}

class RandomName extends StatefulWidget {
  @override
  _RandomNameState createState() => _RandomNameState();
}

class _RandomNameState extends State<RandomName> {
  final _suggestions = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Names"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return Column(
      children: <Widget>[row1(), row2(), row3(), row4()],
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  Widget row1() {
    return Center(
      child: Selector<MyModel, int>(
        builder: (context, number, child) {
          print("rebuilding...");
          return Text("${number}");
        },
        selector: (_, myModel) => myModel.count,
      ),
    );
  }

  Widget row2() {
    return Center(
      child: Text("Row2"),
    );
  }

  Widget row3() {
    return ElevatedButton(
      onPressed: () {
        context.read<MyModel>().increment();
      },
      child: Text("Hello"),
    );
  }

  Widget row4() {
    return TextField(onSubmitted: (str) {
      context.read<MyModel>().setCount(int.parse(str));
    });
  }

  Iterable<String> _getNames() sync* {
    yield faker.person.firstName();
  }
}
