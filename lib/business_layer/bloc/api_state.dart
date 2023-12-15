part of 'api_bloc.dart';

@immutable
abstract class AppState extends Equatable {}

class AppLoadingState extends AppState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AppLoadedState extends AppState {
  final List<ProductModel> productList;
  AppLoadedState({required this.productList});

  @override
  // TODO: implement props
  List<Object?> get props => [productList];

}

class AppErrorState extends AppState {
  final String error;
  AppErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

