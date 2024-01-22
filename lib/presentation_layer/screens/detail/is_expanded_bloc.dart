import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'is_expanded_event.dart';
part 'is_expanded_state.dart';

class IsExpandedBloc extends Bloc<IsExpandedEvent, IsExpandedState> {
  IsExpandedBloc() : super(ExpandedState(isExpanded: false)) {
    on<ExpandedEvent>((event, emit) async {
      if(event.isExpanded) {
        emit(ExpandedState(isExpanded: false));
      } else {
        emit(ExpandedState(isExpanded: true));
      }
    });
  }
}
