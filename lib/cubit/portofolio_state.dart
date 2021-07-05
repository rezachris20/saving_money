part of 'portofolio_cubit.dart';

abstract class PortofolioState extends Equatable {
  const PortofolioState();

  @override
  List<Object> get props => [];
}

class PortofolioInitial extends PortofolioState {}

class PortofolioLoaded extends PortofolioState {
  final List<Portofolio> portofolio;

  PortofolioLoaded(this.portofolio);
  @override
  List<Object> get props => [portofolio]; 
}

class PortofolioLoadedDropdown extends PortofolioState {
  final List<Portofolio> dropdown;

  PortofolioLoadedDropdown(this.dropdown);
  @override
  List<Object> get props => [dropdown]; 
}

class PortofolioLoadingFailed extends PortofolioState {
  final String message;

  PortofolioLoadingFailed(this.message);
  @override
  List<Object> get props => [message];
}
