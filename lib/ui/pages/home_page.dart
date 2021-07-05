part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    context.read<TransactionsCubit>().getTransactions();
    context.read<MySavingsCubit>().getSavings();
    return RefreshIndicator(
      onRefresh: () async {
        // MySavingsState state = context.read<MySavingsCubit>().state;

        // print((context.read<MySavingsCubit>().state as MySavingsLoaded).mySavings.target);
      },
      child: Scaffold(
        backgroundColor: whiteColor1,
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              //// HEADER
              Padding(
                padding: EdgeInsets.only(
                    top: 35, left: defaultMargin, right: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat datang,',
                            style: grayFontStyle1.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            (context.read<UserCubit>().state as UserLoaded)
                                .user
                                .name,
                            style: blackFontStyle1.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage((context
                                            .read<UserCubit>()
                                            .state as UserLoaded)
                                        .user
                                        .picturePath),
                                    fit: BoxFit.cover)),
                          )
                        ]),
                  ],
                ),
              ),
              SizedBox(
                height: 28,
              ),

              Stack(
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage('assets/card.png'),
                            fit: BoxFit.cover)),
                  ),
                  BlocBuilder<MySavingsCubit, MySavingsState>(
                      builder: (_, state) => (state is MySavingsLoaded)
                          ? Padding(
                              padding: const EdgeInsets.only(top: 31),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Tabunganku',
                                      style: whiteFontStyle1.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'Rp ',
                                        decimalDigits: 0,
                                      ).format(state.mySavings.transaksi),
                                      style: whiteFontStyle1.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 76, right: 76),
                                        child: LinearPercentIndicator(
                                          alignment: MainAxisAlignment.center,
                                          width: 200.0,
                                          lineHeight: 3.0,
                                          percent: (state.mySavings.target != 0)
                                              ? state.mySavings.transaksi /
                                                  state.mySavings.target
                                              : 0,
                                          progressColor: Colors.blue,
                                        )),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          NumberFormat.currency(
                                                  locale: 'id-ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(
                                                  state.mySavings.transaksi),
                                          style: whiteFontStyle1.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          " / ",
                                          style: whiteFontStyle1.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                                  locale: 'id-ID',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(state.mySavings.target),
                                          style: whiteFontStyle1.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Center(
                              child: loadingIndicator,
                            ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<MySavingsCubit, MySavingsState>(
                  builder: (context, state) => (state is MySavingsLoaded)
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: defaultMargin, right: defaultMargin),
                          child: (state.mySavings.target != 0)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(SaveMoneyPage());
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                defaultMargin -
                                                defaultMargin,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: blackColor1),
                                        child: Center(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/save_money.png'))),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Simpan',
                                                  style:
                                                      whiteFontStyle1.copyWith(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(PayMoneyPage());
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                defaultMargin -
                                                defaultMargin,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: blackColor1),
                                        child: Center(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/pay.png'))),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Bayar',
                                                  style:
                                                      whiteFontStyle1.copyWith(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(SetTargetPage());
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                defaultMargin,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: blackColor1),
                                        child: Center(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/save_money.png'))),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Set Target',
                                                  style:
                                                      whiteFontStyle1.copyWith(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        )
                      : Center(child: loadingIndicator)),
              SizedBox(
                height: 34,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Center(
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 26, bottom: 9),
                      height: 4,
                      width: 49,
                      color: "CBCBCB".toColor(),
                    ),
                    Text(
                      'Sejarah Transaksi',
                      style: blackFontStyle2.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.337,
                color: Colors.white,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: BlocBuilder<TransactionsCubit,
                                TransactionsState>(
                            builder: (_, state) => (state is TransactionsLoaded)
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.transactions.length,
                                    itemBuilder: (context, index) {
                                      final item = state.transactions[index];
                                      return CardTransactionsHistory(item);
                                    },
                                  )
                                : Center(child: loadingIndicator)),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
