import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app.dart';

part 'product_provider.g.dart';

@riverpod
Future<ProductsModel> products(ref) async {
  try {
    final ProductsRepository productsRepository = ProductsRepository();
    ProductsModel allproducts = await productsRepository.allProducts();
    return allproducts;
  } on ErrorHandler catch (e) {
    throw ErrorHandler(e.message);
  } catch (e) {
    throw const ErrorHandler("Error Occurred");
  }
}

@riverpod
Future<ProductsModel> refreshproducts(ref) async {
  try {
    final ProductsRepository productsRepository = ProductsRepository();
    ProductsModel allproducts = await productsRepository.allProducts();
    return allproducts;
  } on ErrorHandler catch (e) {
    throw ErrorHandler(e.message);
  } catch (e) {
    throw const ErrorHandler("Error Occurred");
  }
}
