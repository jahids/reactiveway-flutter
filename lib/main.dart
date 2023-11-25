import 'package:crudapp/Screen/ProductCreateScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        title: 'Flutter CRUD APP',
        home: ProductCreateScreen());
  }
}
