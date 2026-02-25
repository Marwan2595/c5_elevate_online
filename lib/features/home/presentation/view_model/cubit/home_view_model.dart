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
    : super(HomeState());

  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  Future<void> init() async {
    await Future.wait([getProducts1(), getProducts2()]);
  }

  Future<void> getProducts1() async {
    print("Getting products...");
    // State is now HomeInitialState
    emit(
      state.copyWith(
        productsList1StateParam: state.productsList1State.copyWith(
          isLoadingParam: true,
        ),
      ),
    );
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    // State is now HomeLoadingState
    final response = await getProductsUseCase(page: 1, limit: 10);

    switch (response) {
      case SuccessBaseResponse<List<ProductModel>>():
        print("Products retrieved successfully:");
        response.data.forEach((product) {
          print("- ${product.title} ---- (\$${product.price})");
        });
        emit(
          state.copyWith(
            productsList1StateParam: state.productsList1State.copyWith(
              isLoadingParam: false,
              dataParam: response.data,
            ),
          ),
        );
        // State is now HomeSuccessState
        break;
      case ErrorBaseResponse<List<ProductModel>>():
        print("Failed to retrieve products: ${response.errorMessage}");
        emit(
          state.copyWith(
            productsList1StateParam: state.productsList1State.copyWith(
              isLoadingParam: false,
              errorMessageParam: response.errorMessage,
            ),
          ),
        );
        // State is now HomeErrorState
        break;
    }
  }

  Future<void> getProducts2() async {
    print("Getting products 2...");
    // State is now HomeInitialState
    emit(state.copyWith(isLoadingProducts2Param: true));
    await Future.delayed(Duration(seconds: 5)); // Simulate network delay
    // State is now HomeLoadingState
    final response = await getProductsUseCase(page: 2, limit: 10);

    switch (response) {
      case SuccessBaseResponse<List<ProductModel>>():
        print("Products 2 retrieved successfully:");
        response.data.forEach((product) {
          print("- ${product.title} ---- (\$${product.price})");
        });
        emit(
          state.copyWith(
            isLoadingProducts2Param: false,
            productsList2Param: response.data,
          ),
        );
        // State is now HomeSuccessState
        break;
      case ErrorBaseResponse<List<ProductModel>>():
        print("Failed to retrieve products: ${response.errorMessage}");
        emit(
          state.copyWith(
            isLoadingProducts2Param: false,
            errorMessage2Param: response.errorMessage,
          ),
        );
        // State is now HomeErrorState
        break;
    }
  }
}

// Injection
// 1- Field injection
// 2- Constructor injection<<<<<<<
// 3- Function/Method injection
