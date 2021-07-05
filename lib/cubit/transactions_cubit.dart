import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saving_money/models/models.dart';
import 'package:saving_money/services/services.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transactions>> result = await TransactionsServices.getTransactions();

    if(result.value != null){
      emit(TransactionsLoaded(result.value));
    } else {
      emit(TransactionLoadFailed(result.message));
    }
  }

  Future<void> submitTransactions(Transactions transactions) async {
    
    ApiReturnValue<Transactions> result = await TransactionsServices.submitTransactions(transactions);

    if(result.value != null){
      emit(TransactionsLoaded((state as TransactionsLoaded).transactions + [result.value]));

    } else {
      return null;
    }
  }

  Future<void> detailTransactions( int id) async {
    ApiReturnValue<Transactions> result = await TransactionsServices.detailTransactions(id);

    if(result.value != null){
      emit(DetailTransactionLoaded(result.value));
    }
  }
}
