import 'dart:async';

import 'package:hello_flutter/logic/viewmodel/product_view_model.dart';
import 'package:hello_flutter/model/product.dart';

class ProductBloc {
  final ProductViewModel productViewModel = ProductViewModel();
  final productController = StreamController<List<Product>>();

  // get 方法获取controller的stream
  Stream<List<Product>> get productItems => productController.stream;

  // 构造函数获取数据
  ProductBloc() {
    productController.add(productViewModel.getProduct());
  }
}
