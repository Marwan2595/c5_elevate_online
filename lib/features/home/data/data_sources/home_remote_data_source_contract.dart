import 'package:c5_elevate_online/config/base_response/base_response.dart';
import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';

abstract class HomeRemoteDataSourceContract {
  Future<BaseResponse<List<ProductDTO>>> getProducts( {int? page, int? limit});
  Future<List<String>> getCategories();
}
