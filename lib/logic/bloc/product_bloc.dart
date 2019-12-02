import 'dart:async';

import 'package:hello_flutter/logic/viewmodel/product_view_model.dart';
import 'package:hello_flutter/model/product.dart';

class ProductBloc {
  final ProductViewModel productViewModel = ProductViewModel();
  final productController = StreamController<List<Product>>();

  Stream<List<Product>> get productItems => productController.stream;
  ProductBloc() {
    productController.add(productViewModel.getProduct());
  }
}