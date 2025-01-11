import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      // Execute the business logic
      debugPrint('fake get advice triggered');
      await Future.delayed(const Duration(seconds: 3), () {});
        debugPrint('Got advice');
        emit(AdviceStateLoaded(advice: 'Fake advice to test block'));
        // emit(AdviceStateError(errorMessage: 'Error message'));
    });
  }
}
