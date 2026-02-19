import 'package:c5_elevate_online/core/values/api_param.dart';
import 'package:c5_elevate_online/core/values/endpoints.dart';
import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';
import 'package:c5_elevate_online/features/home/data/models/responses/products_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(AppEndPoints.getProductsEndpoint)
  Future<ProductsResponse> getProducts({
    @Query(ApiParam.pageNumber) int? pageNumber,
    @Query(ApiParam.limit) int? limit,
  });

  @GET(AppEndPoints.getCategoriesEndpoint)
  Future<List<String>> getCategories();
}
