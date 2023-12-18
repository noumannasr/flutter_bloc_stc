part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final ProductDetailModel product;
  DetailLoadedState({required this.product});

}

class DetailErrorState extends DetailState {
  final String error;
  DetailErrorState(this.error);

}
