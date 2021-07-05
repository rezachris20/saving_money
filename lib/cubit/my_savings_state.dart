part of 'my_savings_cubit.dart';

abstract class MySavingsState extends Equatable {
  const MySavingsState();

  @override
  List<Object> get props => [];
}

class MySavingsInitial extends MySavingsState {}

class MySavingsLoaded extends MySavingsState {
  final MySavings mySavings;

  MySavingsLoaded(this.mySavings);

  @override
  List<Object> get props => [mySavings];
}

class MySavingsLoadingFailed extends MySavingsState {
  final String message;

  MySavingsLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
