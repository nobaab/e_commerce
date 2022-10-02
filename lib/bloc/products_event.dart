part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class DataLoadEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}
