import 'package:c5_elevate_online/config/base_response/base_response.dart';
import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';
import 'package:c5_elevate_online/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:c5_elevate_online/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:c5_elevate_online/features/home/presentation/view_model/states/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel(this.getProductsUseCase, this.getCategoriesUseCase)
    : super(HomeInitialState());

  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  Future<void> getProducts() async {
    print("Getting products...");
    // State is now HomeInitialState
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    // State is now HomeLoadingState
    final response = await getProductsUseCase(page: 1, limit: 10);

    switch (response) {
      case SuccessBaseResponse<List<ProductModel>>():
        print("Products retrieved successfully:");
        response.data.forEach((product) {
          print("- ${product.title} ---- (\$${product.price})");
        });
        emit(HomeSuccessState(response.data));
        // State is now HomeSuccessState
        break;
      case ErrorBaseResponse<List<ProductModel>>():
        print("Failed to retrieve products: ${response.errorMessage}");
        emit(HomeErrorState(response.errorMessage));
        // State is now HomeErrorState
        break;
    }
  }
}

// Injection
// 1- Field injection
// 2- Constructor injection<<<<<<<
// 3- Function/Method injection
