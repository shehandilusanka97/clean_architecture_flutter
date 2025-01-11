import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCupitState> {
  AdvicerCubit() : super(AdvicerInitial());

  Future<void> adviceRequested() async {
    emit(AdviceStateLoading());
    // Execute the business logic
    debugPrint('fake get advice triggered');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('Got advice');
    emit(const AdviceStateLoaded(advice: 'Fake advice to test block'));
    // emit(AdviceStateError(errorMessage: 'Error message'));
  }
}
