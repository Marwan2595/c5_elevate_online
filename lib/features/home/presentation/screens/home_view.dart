import 'package:c5_elevate_online/features/home/api/data_sources/home_local_data_source_impl.dart';
import 'package:c5_elevate_online/features/home/api/data_sources/home_remote_data_source_impl.dart';
import 'package:c5_elevate_online/features/home/api/home_api_client/home_api_client.dart';
import 'package:c5_elevate_online/features/home/data/repo/home_repo_impl.dart';
import 'package:c5_elevate_online/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:c5_elevate_online/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:c5_elevate_online/features/home/presentation/view_model/cubit/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  //Dependency Injection
  HomeViewModel viewModel = getIt.get<HomeViewModel>();
  HomeViewModel viewModel = HomeViewModel(
    GetProductsUseCase(
      HomeRepoImpl(
        HomeRemoteDataSourceImpl(HomeApiClient()),
        HomeLocalDataSourceImpl(),
      ),
    ),
    GetCategoriesUseCase(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Screen')),
    );
  }
}
