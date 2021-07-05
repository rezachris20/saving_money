part of 'portofolio_saving_target_cubit.dart';

abstract class PortofolioSavingTargetState extends Equatable {
  const PortofolioSavingTargetState();

  @override
  List<Object> get props => [];
}

class PortofolioSavingTargetInitial extends PortofolioSavingTargetState {}

class PortofolioSavingTargetLoaded extends PortofolioSavingTargetState {
  final PortofolioSavingsTarget portofolioSavingsTarget;

  PortofolioSavingTargetLoaded(this.portofolioSavingsTarget);

  @override
  List<Object> get props => [portofolioSavingsTarget];
}

class PortofolioSavingTargetLoadingFailed extends PortofolioSavingTargetState{
  final String message;

  PortofolioSavingTargetLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
