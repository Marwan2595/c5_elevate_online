import 'package:c5_elevate_online/config/base_response/base_response.dart';
import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';

abstract class HomeRepoContract {
  Future<BaseResponse<List<ProductModel>>> getProducts({int? page, int? limit});
  Future<List<String>> getCategories();
}
