import 'package:c5_elevate_online/config/base_state/base_state.dart';
import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';

class HomeState {
  BaseState<List<ProductModel>> productsList1State =
      BaseState<List<ProductModel>>(isLoading: true, data: []);

  bool isLoadingProducts2 = true;
  List<ProductModel> productsList2 = [];
  String? errorMessage2;

  HomeState({
    BaseState<List<ProductModel>>? productsList1State,

    this.isLoadingProducts2 = true,
    this.productsList2 = const [],
    this.errorMessage2,
  }) {
    this.productsList1State =
        productsList1State ??
        BaseState<List<ProductModel>>(isLoading: true, data: []);
  }

  HomeState copyWith({
    BaseState<List<ProductModel>>? productsList1StateParam,

    bool? isLoadingProducts2Param,
    List<ProductModel>? productsList2Param,
    String? errorMessage2Param,
  }) {
    return HomeState(
      productsList1State: productsList1StateParam ?? productsList1State,
      isLoadingProducts2: isLoadingProducts2Param ?? isLoadingProducts2,
      productsList2: productsList2Param ?? productsList2,
      errorMessage2: errorMessage2Param ?? errorMessage2,
    );
  }
}

// sealed class HomeState {}

// class HomeInitialState extends HomeState {}

// class HomeLoadingState extends HomeState {}

// class HomeSuccessState extends HomeState {
//   final List<ProductModel> products;

//   HomeSuccessState(products);
// }

// class HomeErrorState extends HomeState {
//   final String errorMessage;

//   HomeErrorState(errorMessage);
// }
