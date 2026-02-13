import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';
import 'package:c5_elevate_online/features/home/domain/repo/home_repo_contract.dart';

class GetProductsUseCase {

    GetProductsUseCase(this.homeRepo);
    final HomeRepoContract homeRepo;

  Future<List<ProductModel>> call() async {
    return homeRepo.getProducts();
  }
}
