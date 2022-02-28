import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:testsol/widget/product_item.dart';

import '../providers/products.dart';

class ProductBoard extends StatelessWidget {
  const ProductBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productsContainer = Provider.of<Products>(context);
    var productGroup = productsContainer.getStatusTrueProductGroup;

    return SizedBox(
      height: 600,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            value: productGroup[index],
            child: const ProductItem(),
          );
        },
        itemCount: productGroup.length,
      ),
    );
  }
}
