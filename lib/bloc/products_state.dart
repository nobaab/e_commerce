// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  List<Object?> get props => [];
}

class DataLoadingState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class DataLoadedState extends ProductsState {
  final List<ProductModel> products;
  const DataLoadedState(
    this.products,
  );
  @override
  List<Object?> get props => [products];
}

class DataErrorState extends ProductsState {
  final String error;
  const DataErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
