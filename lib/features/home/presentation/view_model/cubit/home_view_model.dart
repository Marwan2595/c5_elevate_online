import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';
import 'package:c5_elevate_online/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:c5_elevate_online/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  HomeViewModel(this.getProductsUseCase, this.getCategoriesUseCase);

  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  Future<void> getProducts() async {
    print("Getting products...");
    List<ProductModel> products = await getProductsUseCase.call(
      limit: 3,
      page: 5,
    );

    products.forEach((product) {
      print(">>>>>>>>" + product.id + " " + product.title);
    });
  }
}

// Injection
// 1- Field injection
// 2- Constructor injection<<<<<<<
// 3- Function/Method injection
