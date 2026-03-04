import 'package:c5_elevate_online/config/base_response/base_response.dart';
import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';
import 'package:c5_elevate_online/features/home/domain/repo/home_repo_contract.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetProductsUseCase {

    GetProductsUseCase(this.homeRepo);
    final HomeRepoContract homeRepo;

  Future<BaseResponse<List<ProductModel>>> call({int? page, int? limit}) async {
    return await homeRepo.getProducts(  page: page, limit: limit);
  }
}
