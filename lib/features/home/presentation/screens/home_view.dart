import 'package:c5_elevate_online/config/di/di.dart';
import 'package:c5_elevate_online/features/home/presentation/view_model/cubit/home_view_model.dart';
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
        create: (context) =>
            viewModel..getProducts(), //State is now HomeLoadingState
        child: Column(
          children: [
            const Text(
              "Home Appliance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            BlocBuilder<HomeViewModel, HomeState>(
              builder: (context, state) {
                switch (state) {
                  case HomeInitialState():
                  case HomeLoadingState():
                    return const Center(child: CircularProgressIndicator());
                  case HomeSuccessState():
                    return SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return Container(
                            margin: EdgeInsets.all(8),
                            child: Text(product.title),
                          );
                        },
                      ),
                    );
                  case HomeErrorState():
                    return Center(child: Text("Error: ${state.errorMessage}"));
                }
              },
            ),
          ],
        ),
      ),
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