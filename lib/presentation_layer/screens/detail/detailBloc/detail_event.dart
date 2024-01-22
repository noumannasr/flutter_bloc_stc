part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class GetLoadedData extends DetailEvent {
  final ProductModel model;

  GetLoadedData({required this.model});

}
