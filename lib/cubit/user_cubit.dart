import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saving_money/models/models.dart';
import 'package:saving_money/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signOut() async {
    ApiReturnValue<User> result = await UserServices.signOut();

    if (result.message == "sukses") {
      emit(UserSignout());
    } else {
      return false;
    }
  }

  Future<void> signUp(User user, String password, String confirmPassword,
      {File pictureFile}) async {
    ApiReturnValue<User> result = await UserServices.signUp(
        user, password, confirmPassword,
        pictureFile: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  generateKodeFamily() async {
    ApiReturnValue<String> result = await UserServices.generateKodeFamily();

    if (result.value != null) {
      return result.value;
    } else {
      return false;
    }
  }

  Future<void> editProfile(User user,{File pictureFile}) async {
    ApiReturnValue<User> result = await UserServices.editProfile(user,pictureFile: pictureFile);
    if (result.value != null) {
      // return result.value;
      // emit(UserLoaded((state as UserLoaded).user + [result.value]));
      emit(UserLoaded(result.value));
    } else {
      return false;
    }
  }
}
