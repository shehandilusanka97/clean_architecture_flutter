part of 'advicer_cubit.dart';

sealed class AdvicerCupitState extends Equatable {
  const AdvicerCupitState();

  @override
  List<Object?> get props => [];
}

final class AdvicerInitial extends AdvicerCupitState {}

final class AdviceInitial extends AdvicerCupitState {}

final class AdviceStateLoading extends AdvicerCupitState {}

final class AdviceStateLoaded extends AdvicerCupitState {
  final String advice;
  const AdviceStateLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

final class AdviceStateError extends AdvicerCupitState {
  final String errorMessage;
  const AdviceStateError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
