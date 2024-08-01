import 'package:aevue_demo/app.dart';
import 'package:dio/dio.dart';

import '../../main.dart';

class ProductsRepository {
  Future<ProductsModel> allProducts() async {
    try {
      final response =
          await dio.get(Apis.products, onReceiveProgress: (max, progress) {
        printDebug("max: $max ; profress: $progress");
      });
      if (response.statusCode == 200) {
        final result = response.data;
        final products = ProductsModel.fromJson(result);

        return products;
      } else {
        throw const ErrorHandler("Error Loading Products!");
      }
    } on DioException catch (_) {
      throw const ErrorHandler("Network Error");
    } catch (e) {
      throw const ErrorHandler("Error Occurred");
    }
  }
}
