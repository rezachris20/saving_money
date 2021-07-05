part of 'list_family_cubit.dart';

abstract class ListFamilyState extends Equatable {
  const ListFamilyState();

  @override
  List<Object> get props => [];
}

class ListFamilyInitial extends ListFamilyState {}

class ListFamilyLoaded extends ListFamilyState {
  final List<ListFamily> listFamily;

  ListFamilyLoaded(this.listFamily);

  @override
  List<Object> get props => [listFamily];
}

class ListFamilyLoadingFailed extends ListFamilyState {
  final String message;

  ListFamilyLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}