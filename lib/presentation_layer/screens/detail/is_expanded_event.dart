part of 'is_expanded_bloc.dart';

@immutable
abstract class IsExpandedEvent {}
class ExpandedEvent extends IsExpandedEvent {
  final bool isExpanded;
  ExpandedEvent({required this.isExpanded});
}