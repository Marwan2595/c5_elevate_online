import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';

class HomeApiClient {
  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return ['Category 1', 'Category 2', 'Category 3'];
  }

  Future<List<ProductDto>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [ProductDto(), ProductDto(), ProductDto()];
  }
}
