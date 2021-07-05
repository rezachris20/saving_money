import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saving_money/models/models.dart';
import 'package:saving_money/services/services.dart';

part 'my_savings_state.dart';

class MySavingsCubit extends Cubit<MySavingsState> {
  MySavingsCubit() : super(MySavingsInitial());

  Future<void> getSavings() async {
    ApiReturnValue<MySavings> result = await MySavingsServices.getSavings();
    if (result.value != null) {
      emit(MySavingsLoaded(result.value));
    } else {
      emit(MySavingsLoadingFailed(result.message));
    }
  }
}
