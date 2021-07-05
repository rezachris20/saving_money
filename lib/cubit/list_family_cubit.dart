import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saving_money/models/models.dart';
import 'package:saving_money/services/services.dart';

part 'list_family_state.dart';

class ListFamilyCubit extends Cubit<ListFamilyState> {
  ListFamilyCubit() : super(ListFamilyInitial());

  Future<void> getList() async {
    ApiReturnValue<List<ListFamily>> result = await ListOfFamilyServices.getList();

    if (result.value != null) {
      emit(ListFamilyLoaded(result.value));
    } else {
      emit(ListFamilyLoadingFailed(result.message));
    }
  }
}
