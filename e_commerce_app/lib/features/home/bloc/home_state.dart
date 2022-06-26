part of 'home_bloc.dart';

class HomeState extends Equatable {
  List<Product>? categories;
  bool isInitialized;
  HomeState({
    required this.isInitialized,
    this.categories,
  });

  HomeState copyWith({
    List<Product>? categories,
    bool? isInitialized,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }

  @override
  List<Object?> get props => [categories, isInitialized];
}
