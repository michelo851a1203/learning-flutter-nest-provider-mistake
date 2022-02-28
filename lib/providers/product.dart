import 'package:flutter/material.dart';

class Product with ChangeNotifier {
    String id;
    String title;
    double price;
    bool status;
    Product(this.id, this.title,this.price,this.status);

    void changeStatus() {
        status = !status;
        notifyListeners();
    }
}
