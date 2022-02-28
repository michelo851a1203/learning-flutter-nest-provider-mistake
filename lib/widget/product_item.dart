import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productContainer = Provider.of<Product>(context, listen: false);
    return ListTile(
        leading: CircleAvatar(
            radius: 25,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(productContainer.price.toStringAsFixed(2)),
              ),
            )),
        title: Text(productContainer.title,
            style: TextStyle(
                color: productContainer.status ? Colors.blue : Colors.red)),
        trailing: Consumer<Product>(
            builder: (ctx, productItem, child) => Wrap(
                  spacing: 10,
                  children: [
                    IconButton(
                      onPressed: () => productItem.changeStatus(),
                      icon: const Icon(Icons.delete),
                      color: productContainer.status ? Colors.blue : Colors.red,
                    ),
                  ],
                )));
  }
}
