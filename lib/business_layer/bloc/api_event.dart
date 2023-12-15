part of 'api_bloc.dart';

@immutable
abstract class ApiEvent extends Equatable {

 const ApiEvent();

}
class LoadGetData extends ApiEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// class GetProductsData extends ApiEvent {
//
//   final List<ProductModel> productList;
//
//  const GetProductsData({required this.productList});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [productList];
//
// }