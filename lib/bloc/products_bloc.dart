// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/api_service.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;
  ProductsBloc(
    this._productsRepository,
  ) : super(ProductsInitial()) {
    on<DataLoadEvent>((event, emit) async {
      emit(DataLoadingState());

      try {
        final products = await _productsRepository.getProducts();
        emit(DataLoadedState(products));
      } catch (e) {
        emit(DataErrorState(error: e.toString()));
      }
    });
  }
}
