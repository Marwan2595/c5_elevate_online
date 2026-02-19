import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';

abstract class HomeLocalDataSourceContract {
  Future<List<ProductDTO>> getProducts();
  Future<List<String>> getCategories();
}
