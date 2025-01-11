part of 'advice_bloc.dart';

@immutable
sealed class AdviceState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AdviceInitial extends AdviceState {}

final class AdviceStateLoading extends AdviceState {}

final class AdviceStateLoaded extends AdviceState {
  final String advice;
  AdviceStateLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

final class AdviceStateError extends AdviceState {
  final String errorMessage;
  AdviceStateError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
