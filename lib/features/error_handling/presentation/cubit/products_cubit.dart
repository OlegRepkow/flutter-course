import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/error_handling/data/repository/products_repository.dart';
import 'package:flutter_lab/features/error_handling/presentation/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._repository) : super(const ProductsState.initial());

  final ProductsRepository _repository;

  Future<void> getProducts() async {
    try {
      final products = await _repository.getProducts();

      emit(state.copyWith(status: ProductsStatus.loaded, products: products));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errorMessage: e.toString(),
        ),
      );

      rethrow;
    }
  }
}
