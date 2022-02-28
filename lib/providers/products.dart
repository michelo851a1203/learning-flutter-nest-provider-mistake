import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:testsol/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> productGroup = [];

  List<Product> get getProductGroup {
    return [...productGroup];
  }

  List<Product> get getStatusTrueProductGroup {
      return [...productGroup.where((productItem) => productItem.status)];
  }

  void showCurrentProductGroup() {
      for (var productItem in getProductGroup) {
          print("id : ${productItem.title}, status : ${productItem.status}");
      }
  }

  int randomIntegerGenerator(int length) {
    Random rng = Random.secure();
    return rng.nextInt(length);
  }

  double randomPriceGenerator(double upperBound, double lowerBound) {
    Random rng = Random.secure();
    return (upperBound - lowerBound) * rng.nextDouble() + lowerBound;
  }

  String randomStringGenrerator(int stringLength) {
    const _char = "abcdefghijklmnopqrstuvwxyz0123456789";
    Random rng = Random();
    return String.fromCharCodes(Iterable.generate(stringLength, (_) {
      return _char.codeUnitAt(rng.nextInt(_char.length));
    }));
  }

  String randomIdGenerator() {
    String generatedId = "";
    while (generatedId == "") {
      int randomLength = randomIntegerGenerator(20);
      String pickedId = randomStringGenrerator(randomLength);
      Product product = getProductGroup.firstWhere(
          (productItem) => productItem.id == pickedId,
          orElse: () => Product("", "", 0, true));
      if (product.price == 0) {
        generatedId = pickedId;
      }
    }
    return generatedId;
  }

  bool addRandomProduct() {
    Product productInfo = Product(randomIdGenerator(),
        randomStringGenrerator(8), randomPriceGenerator(1, 100), true);

    return addProduct(productInfo);
  }

  bool addProduct(Product product) {
    int previousProductCount = getProductGroup.length;
    productGroup.add(product);
    int pickedProductCount = getProductGroup.length;
    notifyListeners();
    return pickedProductCount == (previousProductCount + 1);
  }

  bool removeProduct(Product product) {
    int previousProductCount = getProductGroup.length;
    productGroup.remove(product);
    int pickedProductCount = getProductGroup.length;
    notifyListeners();
    return pickedProductCount == (previousProductCount + 1);
  }

  bool removeProductWithId(String id) {
    int previousProductCount = getProductGroup.length;
    Product product =
        getProductGroup.firstWhere((productItem) => productItem.id == id);
    productGroup.remove(product);
    int pickedProductCount = getProductGroup.length;
    notifyListeners();
    return pickedProductCount == (previousProductCount + 1);
  }
}
