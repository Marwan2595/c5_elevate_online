import 'dart:async';


import 'package:dio/dio.dart';
import 'package:c5_elevate_online/config/base_response/base_response.dart';
import 'package:c5_elevate_online/features/home/api/home_api_client/home_api_client.dart';
import 'package:c5_elevate_online/features/home/data/data_sources/home_remote_data_source_contract.dart';
import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  HomeRemoteDataSourceImpl(this.homeApiClient);
  final HomeApiClient homeApiClient;

  @override
  Future<List<String>> getCategories() {
    return homeApiClient.getCategories();
  }

  @override
  Future<BaseResponse<List<ProductDTO>>> getProducts({
    int? page,
    int? limit,
  }) async {
    try {
      //Success
      final response = await homeApiClient.getProducts(
        pageNumber: page,
        limit: limit,
      );
      return SuccessBaseResponse<List<ProductDTO>>(data: response.data ?? []);
    } catch (e) {
      //Error
      if (e is DioException) {
        //Handle Dio Exception
        return ErrorBaseResponse<List<ProductDTO>>(errorMessage: e.message ?? "Dio Exception");
        
      }else if (e is TimeoutException) {
        //Handle Timeout Exception
        return ErrorBaseResponse<List<ProductDTO>>(errorMessage: "Request timed out. Please try again later.");
      }
      return ErrorBaseResponse<List<ProductDTO>>(errorMessage: "Something went wrong. Please try again later.");
    }
  }
}
