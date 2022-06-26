import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/product/model/product/product.dart';
import 'package:e_commerce_app/product/service/product_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IProductService productService;
  HomeBloc(this.productService) : super(HomeState(isInitialized: false)) {
    on<HomeEvent>((event, emit) async {
      if (event is InitializeHome) {
        final categories = await productService.getProductCategories();
        print(categories);
        emit(
          state.copyWith(categories: categories, isInitialized: true),
        );
      }
    });
  }
}
