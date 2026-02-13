import 'package:c5_elevate_online/features/home/api/home_api_client/home_api_client.dart';
import 'package:c5_elevate_online/features/home/data/data_sources/home_remote_data_source_contract.dart';
import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {

  HomeRemoteDataSourceImpl(this.homeApiClient);
  final HomeApiClient homeApiClient;

  @override
  Future<List<String>> getCategories() {
    return homeApiClient.getCategories();
  }

  @override
  Future<List<ProductDto>> getProducts() {
    return homeApiClient.getProducts();
  }
}
