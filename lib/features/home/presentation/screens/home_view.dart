import 'package:c5_elevate_online/config/di/di.dart';
import 'package:c5_elevate_online/features/home/presentation/view_model/cubit/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeViewModel viewModel = getIt.get<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    viewModel.getProducts();
    return const Placeholder();
  }
}


// 1 - API Call DIO/RETROFIT
// 2 - Handling Response (Success, Failure) //sealed class
// 3 - State Management
// 4 - Dependency Injection DONE

