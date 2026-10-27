import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/error_handling/presentation/cubit/products_cubit.dart';
import 'package:flutter_lab/features/error_handling/presentation/cubit/products_state.dart';

class ProductsPageExample extends StatelessWidget {
  const ProductsPageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Page Example'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return switch (state.status) {
              // Initial state
              ProductsStatus.initial => const Center(
                child: Text(
                  'Products Page Example',
                  style: TextStyle(fontSize: 24),
                ),
              ),

              // Loading state
              ProductsStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),

              // Loaded state
              ProductsStatus.loaded => ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(state.products[index].title),
                      subtitle: Text(state.products[index].price),
                      leading: Image.network(state.products[index].imageUrl),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),

              // Error state
              ProductsStatus.error => Center(
                child: Text(
                  state.errorMessage ?? 'Error',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
