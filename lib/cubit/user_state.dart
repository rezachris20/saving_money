part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserLoadingFailed extends UserState {
  final String message;

  UserLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}

class UserSignout extends UserState {
   @override
  List<Object> get props => [];
}
