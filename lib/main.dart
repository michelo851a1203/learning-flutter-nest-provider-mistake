import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:testsol/providers/products.dart';
import 'package:testsol/widget/product_board.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => Products(),
        child: const MaterialApp(home: MyController()));
  }
}

class MyController extends StatefulWidget {
  const MyController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyControllerState();
}

class _MyControllerState extends State<MyController> {
  @override
  Widget build(BuildContext context) {
    final productContainers = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  productContainers.addRandomProduct();
                },
                icon: const Icon(Icons.add),
                label: const Text("Add")),
            ElevatedButton.icon(
                onPressed: () {
                  productContainers.showCurrentProductGroup();
                },
                icon: const Icon(Icons.edit),
                label: const Text("Show Current Data")),
            const ProductBoard(),
          ],
        ),
      ),
    );
  }
}
