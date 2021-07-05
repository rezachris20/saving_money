part of 'widgets.dart';

class MyCustomCardPortofolio extends StatelessWidget {
  final Portofolio portofolio;

  MyCustomCardPortofolio(this.portofolio);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 38, bottom: 37),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/pensiun.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  portofolio.name,
                  style: blackFontStyle2.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    child: LinearPercentIndicator(
                  alignment: MainAxisAlignment.start,
                  width: 160.0,
                  lineHeight: 3.0,
                  percent: portofolio.mySavings / portofolio.target,
                  progressColor: Colors.blue,
                )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id-ID',
                        symbol: 'Rp ',
                        decimalDigits: 0
                      ).format(portofolio.mySavings),
                      style: grayFontStyle3.copyWith(
                          fontSize: 11, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ' / ',
                      style: grayFontStyle3.copyWith(
                          fontSize: 11, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id-ID',
                        symbol: 'Rp ',
                        decimalDigits: 0
                      ).format(portofolio.target),
                      style: grayFontStyle3.copyWith(
                          fontSize: 11, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                  margin: EdgeInsets.only(right: 20, bottom: 14),
                  child: Text((portofolio.mySavings != 0 ) ? 'Transaksi terakhir\n' + convertDateTime(portofolio.lastSavings): '',
                      style: grayFontStyle2.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500), textAlign: TextAlign.right,))
            ],
          )
        ],
      ),
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
