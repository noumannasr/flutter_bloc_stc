part of 'is_expanded_bloc.dart';

@immutable
abstract class IsExpandedState {}

// class IsExpandedInitial extends IsExpandedState {}
class ExpandedState extends IsExpandedState {
  final bool isExpanded;

  ExpandedState({required this.isExpanded});

}