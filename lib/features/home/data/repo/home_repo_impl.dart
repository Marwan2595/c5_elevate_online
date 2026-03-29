import 'package:c5_elevate_online/config/base_response/base_response.dart';
import 'package:c5_elevate_online/features/home/data/data_sources/home_local_data_source_contract.dart';
import 'package:c5_elevate_online/features/home/data/data_sources/home_remote_data_source_contract.dart';
import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';
import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';
import 'package:c5_elevate_online/features/home/domain/repo/home_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {
  HomeRepoImpl(this.homeRemoteDataSource, this.homeLocalDataSource);
  final HomeRemoteDataSourceContract homeRemoteDataSource;
  final HomeLocalDataSourceContract homeLocalDataSource;

  // Test Cases
  // homeRemoteDataSource.getProducts return SuccessBaseResponse<List<ProductDTO>> with 0 dtos
  // homeRemoteDataSource.getProducts return SuccessBaseResponse<List<ProductDTO>> with 5 dtos
  // homeRemoteDataSource.getProducts return ErrorBaseResponse<List<ProductDTO>>

  //  Test Cases (Mocking)
  // final response = SuccessBaseResponse<List<ProductDTO>>(data: []);//
  // final response = SuccessBaseResponse<List<ProductDTO>>(data: [ProductDTO(),ProductDTO(),ProductDTO(),ProductDTO(),ProductDTO()]);
  // final response = ErrorBaseResponse<List<ProductDTO>>(errorMessage: "Something went wrong. Please try again later.");
  @override
  Future<BaseResponse<List<ProductModel>>> getProducts({
    int? page,
    int? limit,
  }) async {
    // Check for internet connection

    final response = await homeRemoteDataSource.getProducts(
      page: page,
      limit: limit,
    );
    switch (response) {
      case SuccessBaseResponse<List<ProductDTO>>():
        return SuccessBaseResponse<List<ProductModel>>(
          data: response.data?.map((dto) => dto.toDomain()).toList() ?? [],
        );
      case ErrorBaseResponse<List<ProductDTO>>():
        return ErrorBaseResponse<List<ProductModel>>(
          errorMessage: response.errorMessage,
        );
    }
  }

  @override
  Future<List<String>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
