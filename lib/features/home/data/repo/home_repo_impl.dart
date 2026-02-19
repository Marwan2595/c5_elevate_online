import 'package:c5_elevate_online/features/home/data/data_sources/home_local_data_source_contract.dart';
import 'package:c5_elevate_online/features/home/data/data_sources/home_remote_data_source_contract.dart';
import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';
import 'package:c5_elevate_online/features/home/domain/repo/home_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {
  HomeRepoImpl(this.homeRemoteDataSource, this.homeLocalDataSource);
  final HomeRemoteDataSourceContract homeRemoteDataSource;
  final HomeLocalDataSourceContract homeLocalDataSource;

  @override
  Future<List<ProductModel>> getProducts( {int? page, int? limit}) async {
    // Check for internet connection
    return homeRemoteDataSource.getProducts(page: page, limit: limit).then((productsDTOs) {
      return productsDTOs.map((dto) => dto.toDomain()).toList();
    });
  }

  @override
  Future<List<String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
