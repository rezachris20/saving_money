part of 'pages.dart';

class DetailTransaksiPage extends StatelessWidget {
  final int id;

  DetailTransaksiPage({this.id});

  @override
  Widget build(BuildContext context) {
    final transactionsC = Get.put(TransactionController());

    return Scaffold(
      backgroundColor: whiteColor1,
      body: SingleChildScrollView(
        child: Column(children: [
          SafeArea(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.24,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      image: DecorationImage(
                          image: AssetImage('assets/card_portofolio.png'),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 35),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Obx(() => Text(
                              "${transactionsC.transactions.name}",
                              style: whiteFontStyle1.copyWith(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            )),
                        SizedBox(height: 12),
                        Obx(
                          () => Text(
                            NumberFormat.currency(
                              locale: 'id-ID',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format(("${transactionsC.transactions.nominal}")
                                .toInt()),
                            style: whiteFontStyle1.copyWith(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() => Container(
                            padding: EdgeInsets.only(left: 76, right: 76),
                            child: LinearPercentIndicator(
                              alignment: MainAxisAlignment.center,
                              width: 200.0,
                              lineHeight: 3.0,
                              percent: ("${transactionsC.transactions.percent}")
                                  .toDouble(),
                              progressColor: Colors.blue,
                            ))),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(
                                        ('${transactionsC.transactions.nominal}')
                                            .toInt()),
                                style: whiteFontStyle1.copyWith(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              " / ",
                              style: whiteFontStyle1.copyWith(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            Obx(
                              () => Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'Rp ',
                                        decimalDigits: 0)
                                    .format(
                                        ('${transactionsC.transactions.target}')
                                            .toInt()),
                                style: whiteFontStyle1.copyWith(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 60),
            margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
            child: Column(
              children: [
                Text('Detail Transaksi',
                    style: blackFontStyle2.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                Container(
                    margin: EdgeInsets.only(top: 26, bottom: 15),
                    width: double.infinity,
                    height: 1,
                    color: "B0B0B5".toColor()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nama',
                        style: grayFontStyle4.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        )),
                    Obx(() => Text(
                          "${transactionsC.transactions.userName}",
                          style: blackFontStyle2.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nominal',
                        style: grayFontStyle4.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        )),
                    Obx(() => Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'Rp ',
                                  decimalDigits: 0)
                              .format(('${transactionsC.transactions.nominal}')
                                  .toInt()),
                          style: blackFontStyle2.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Keterangan',
                        style: grayFontStyle4.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        )),
                    Obx(() => Text(
                          "${transactionsC.transactions.keterangan}",
                          style: blackFontStyle2.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tanggal',
                        style: grayFontStyle4.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        )),
                    Obx(() => Text(
                          (transactionsC.transactions.tanggal != "")
                              ? convertDateTime(
                                  "${transactionsC.transactions.tanggal}")
                              : "-",
                          style: blackFontStyle2.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Portofolio',
                        style: grayFontStyle4.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        )),
                    Obx(() => Text(
                          "${transactionsC.transactions.name}",
                          style: blackFontStyle2.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Keterangan',
                        style: grayFontStyle4.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        )),
                    Obx(() => Text(
                          "${transactionsC.transactions.description}",
                          style: blackFontStyle2.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: double.infinity,
                    height: 1,
                    color: "B0B0B5".toColor()),
                SizedBox(
                  height: 61,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 153,
                //       height: 39,
                //       child: ElevatedButton(
                //           onPressed: () {},
                //           style: ElevatedButton.styleFrom(
                //             elevation: 0,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(8)),
                //             primary: blueColor1,
                //           ),
                //           child: Text(
                //             'Edit',
                //             style: GoogleFonts.poppins(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold),
                //           )),
                //     ),
                //     Container(
                //       width: 153,
                //       height: 39,
                //       child: ElevatedButton(
                //           onPressed: () {
                //             Alert(
                //               context: context,
                //               type: AlertType.info,
                //               title: "Hapus Transaksi",
                //               desc:
                //                   "Apakah anda yakin akan hapus transaksi ini?",
                //               buttons: [
                //                 DialogButton(
                //                     child: Text(
                //                       "Tidak",
                //                       style: TextStyle(
                //                           color: Colors.white, fontSize: 18),
                //                     ),
                //                     onPressed: () => Navigator.pop(context),
                //                     color: "84A9FF".toColor()),
                //                 DialogButton(
                //                     child: Text(
                //                       "Ya",
                //                       style: TextStyle(
                //                           color: Colors.white, fontSize: 18),
                //                     ),
                //                     onPressed: () {},
                //                     color: "3366FF".toColor())
                //               ],
                //             ).show();
                //           },
                //           style: ElevatedButton.styleFrom(
                //             elevation: 0,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(8)),
                //             primary: "84A9FF".toColor(),
                //           ),
                //           child: Text(
                //             'Hapus',
                //             style: GoogleFonts.poppins(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold),
                //           )),
                //     )
                //   ],
                // )
              ],
            ),
          )
        ]),
      ),
    );
  }

  String convertDateTime(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);

    String month;

    switch (todayDate.month) {
      case 1:
        month = 'Januari';
        break;
      case 2:
        month = 'Februari';
        break;
      case 3:
        month = 'Maret';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Juni';
        break;
      case 7:
        month = 'Juli';
        break;
      case 8:
        month = 'Agustus';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'Okttober';
        break;
      case 11:
        month = 'November';
        break;
      default:
        month = 'Desember';
    }
    return (formatDate(todayDate, [dd, ' ', month, ' ', yyyy]));
  }
}
