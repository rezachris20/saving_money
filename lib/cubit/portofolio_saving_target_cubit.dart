import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saving_money/models/models.dart';
import 'package:saving_money/services/services.dart';

part 'portofolio_saving_target_state.dart';

class PortofolioSavingTargetCubit extends Cubit<PortofolioSavingTargetState> {
  PortofolioSavingTargetCubit() : super(PortofolioSavingTargetInitial());

  Future<void> getSavings() async {
    ApiReturnValue<PortofolioSavingsTarget> result = await PortofolioSavingsTargetServices.getSavings();

    if(result.value != null) {
      emit(PortofolioSavingTargetLoaded(result.value));
    } else {
      PortofolioSavingTargetLoadingFailed(result.message);
    }
  }
}
