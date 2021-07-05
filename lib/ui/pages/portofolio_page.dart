part of 'pages.dart';

class PortofolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<PortofolioCubit>().getPortofolio();
    context.read<PortofolioSavingTargetCubit>().getSavings();
    return Scaffold(
        backgroundColor: whiteColor1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                      child: BlocBuilder<PortofolioSavingTargetCubit,
                          PortofolioSavingTargetState>(
                        builder: (_, state) => (state
                                is PortofolioSavingTargetLoaded)
                            ? Container(
                                margin: EdgeInsets.only(top: 35),
                                child: Column(
                                  children: [
                                    Text(
                                      'Portofolio Saya',
                                      style: whiteFontStyle1.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'Nilai Tersimpan',
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
                                      ).format(state
                                          .portofolioSavingsTarget.mySavings),
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
                                          percent: (state
                                                      .portofolioSavingsTarget
                                                      .target !=
                                                  0)
                                              ? state.portofolioSavingsTarget
                                                      .mySavings /
                                                  state.portofolioSavingsTarget
                                                      .target
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
                                              .format(state
                                                  .portofolioSavingsTarget
                                                  .mySavings),
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
                                              .format(state
                                                  .portofolioSavingsTarget
                                                  .target),
                                          style: whiteFontStyle1.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Center(child: loadingIndicator),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.49,
                  child: BlocBuilder<PortofolioCubit, PortofolioState>(
                      builder: (_, state) => (state is PortofolioLoaded)
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.portofolio.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = state.portofolio[index];
                                return MyCustomCardPortofolio(item);
                              }
                              //
                              )
                          : Center(child: loadingIndicator))),
              SizedBox(height: 20),
              Container(
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('+ buat portofolio',
                          style: blackFontStyle2.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onPressed: () {
                    Get.to(AddPortofolioPage());
                  },
                ),
              )
            ],
          ),
        ));
  }
}
