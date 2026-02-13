import 'package:c5_elevate_online/features/home/data/data_sources/home_local_data_source_contract.dart';
import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSourceContract {
  @override
  Future<List<String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<List<ProductDto>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}