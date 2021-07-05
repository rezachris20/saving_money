import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saving_money/cubit/cubit.dart';
import 'package:saving_money/models/models.dart';
import 'package:saving_money/services/services.dart';

part 'portofolio_state.dart';

class PortofolioCubit extends Cubit<PortofolioState> {
  PortofolioCubit() : super(PortofolioInitial());

  Future<void> getPortofolio() async {
    ApiReturnValue<List<Portofolio>> result = await PortofolioServices.getPortofolio();

    if(result.value != null){
      emit(PortofolioLoaded(result.value));
    } else {
      emit(PortofolioLoadingFailed(result.message));
    }
  }

  Future<void> getDropdown() async {
    ApiReturnValue<List<Portofolio>> result = await PortofolioServices.getDropdown();

    if(result.value != null){
      emit(PortofolioLoadedDropdown(result.value));
    } else {
      emit(PortofolioLoadingFailed(result.message));
    }
  }

  Future<void> addNewPortofolio(Portofolio portofolio) async {
    ApiReturnValue<Portofolio> result = await PortofolioServices.addNewPortofolio(portofolio);

    if(result.value != null){
      emit(PortofolioLoaded((state as PortofolioLoaded).portofolio + [result.value]));
    } else {
      return null;
    }
  }

  Future<void> submitTarget(Portofolio portofolio) async {
    ApiReturnValue<Portofolio> result = await PortofolioServices.submitTarget(portofolio);

    if(result.value != null){
      return true;
    }
  }
}
