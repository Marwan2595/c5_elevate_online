import 'package:c5_elevate_online/config/di/di.dart';
import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';
import 'package:c5_elevate_online/features/home/presentation/view_model/cubit/home_view_model.dart';
import 'package:c5_elevate_online/features/home/presentation/view_model/states/home_events.dart';
import 'package:c5_elevate_online/features/home/presentation/view_model/states/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeViewModel viewModel = getIt.get<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: BlocProvider<HomeViewModel>(
        create: (context) => viewModel..doEvent(GetAllDataEvent()),
        child: Column(
          children: [
            BlocBuilder<HomeViewModel, HomeState>(
              builder: (context, state) {
                return ProductHorizontalList(
                  title: "Home Applications",
                  productsList: state.productsList1State.data ?? [],
                  isLoading: state.productsList1State.isLoading,
                  errorMessage: state.productsList1State.errorMessage,
                );
              },
              buildWhen: (previous, current) {
                return current.productsList1State !=
                    previous.productsList1State;
              },
            ),

            const SizedBox(height: 32),

            BlocBuilder<HomeViewModel, HomeState>(
              builder: (context, state) {
                return ProductHorizontalList(
                  title: "New Arrivals",
                  productsList: state.productsList2,
                  isLoading: state.isLoadingProducts2,
                  errorMessage: state.errorMessage2,
                );
              },
              buildWhen: (previous, current) {
                return current.productsList2 != previous.productsList2 ||
                    current.isLoadingProducts2 != previous.isLoadingProducts2 ||
                    current.errorMessage2 != previous.errorMessage2;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductHorizontalList extends StatelessWidget {
  const ProductHorizontalList({
    super.key,
    required this.title,
    this.productsList = const [],
    this.isLoading = true,
    this.errorMessage,
  });
  final String title;
  final List<ProductModel> productsList;
  final bool isLoading;
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Center(child: Text("Error: $errorMessage")),

        if (productsList.isNotEmpty && isLoading == false)
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = productsList[index];
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Text(product.title),
                );
              },
            ),
          ),
        if (isLoading) const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

// 1 - API Call DIO/RETROFIT //DONE
// 2 - Handling Response (Success, Failure) //sealed class //DONE
// 3 - State Management
// 4 - Dependency Injection //DONE




// BlocProvider
// BlocBuilder
// BlocListener
// BlocConsumer