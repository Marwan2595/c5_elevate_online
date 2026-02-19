import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';

abstract class HomeRemoteDataSourceContract {
  Future<List<ProductDTO>> getProducts( {int? page, int? limit});
  Future<List<String>> getCategories();
}
