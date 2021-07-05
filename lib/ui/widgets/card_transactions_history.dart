part of 'widgets.dart';

class CardTransactionsHistory extends StatelessWidget {
  final Transactions transactions;

  CardTransactionsHistory(this.transactions);

  @override
  Widget build(BuildContext context) {
    final TransactionController c = Get.put(TransactionController());
    return GestureDetector(
      onTap: () {
        final int id = transactions.id;
        var result = c.detailTransactions(id);
        if (result != null) {
          Get.to(DetailTransaksiPage(id: id));
        }
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              //// Icon
              Container(
                margin: EdgeInsets.only(left: defaultMargin, right: 10),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: (transactions.debitOrKredit == 1)
                          ? AssetImage('assets/debit.png')
                          : AssetImage('assets/kredit.png'),
                      fit: BoxFit.cover),
                ),
              ),
              //// Keterangan
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (transactions.description != null)
                          ? transactions.description
                          : "Success",
                      style: blackFontStyle2.copyWith(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                    Text(
                      convertDateTime(transactions.tanggal),
                      style: grayFontStyle2.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Spacer(),
              //// Nominal
              Container(
                margin: EdgeInsets.only(right: defaultMargin),
                child: Text(
                  NumberFormat.currency(
                    locale: 'id-ID',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(transactions.nominal),
                  style: blackFontStyle2.copyWith(
                      fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )),
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Okt';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
    }

    return ' ${dateTime.day} ' + month + ' ${dateTime.year}';
  }
}
