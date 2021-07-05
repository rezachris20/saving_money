part of 'transactions_cubit.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoaded extends TransactionsState {
  final List<Transactions> transactions;

  TransactionsLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionLoadFailed extends TransactionsState {
  final String message;

  TransactionLoadFailed(this.message);

  @override
  List<Object> get props => [message];
}

class DetailTransactionLoaded extends TransactionsState {
  final Transactions detailTransaction;

  DetailTransactionLoaded(this.detailTransaction);

  @override
  List<Object> get props => [detailTransaction];
}
