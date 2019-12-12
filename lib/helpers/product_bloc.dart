import 'dart:async';

import 'package:mac_mobile_attempt/helpers/product_view_model.dart';
import 'package:mac_mobile_attempt/helpers/product.dart';

class ProductBloc {
  final ProductViewModel productViewModel = ProductViewModel();
  final productController = StreamController<List<Product>>();
  Stream<List<Product>> get productItems => productController.stream;

  productBloc() {
    productController.add(productViewModel.getProducts());
  }
}
