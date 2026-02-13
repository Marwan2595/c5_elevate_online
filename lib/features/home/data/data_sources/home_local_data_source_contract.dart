import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';

abstract class HomeLocalDataSourceContract {
  Future<List<ProductDto>> getProducts();
  Future<List<String>> getCategories();}
