part of 'pages.dart';

class SaveMoneyPage extends StatefulWidget {
  @override
  _SaveMoneyPageState createState() => _SaveMoneyPageState();
}

class _SaveMoneyPageState extends State<SaveMoneyPage> {
  TextEditingController nominalController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController goalSavingController = TextEditingController();
  List<String> portofolio;
  String selectedPortofolio;

  bool isLoading = false;

  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    context.read<PortofolioCubit>().getDropdown();
    return GeneralPage(
      title: "Simpan Uang",
      subtitle: "Simpan uang untuk target anda",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 1.64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0.7,
                blurRadius: 20,
                // offset: Offset(2,-20)
                // changes position of shadow
              ),
            ]),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 32),
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Nominal",
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                controller: nominalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: grayFontStyle2,
                    hintText: "Ketik nominal"),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Tanggal",
                style: blackFontStyle2,
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: DateTimeField(
                  controller: tanggalController,
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        initialDate: currentValue ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                  },
                )),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Portofolio",
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: BlocBuilder<PortofolioCubit, PortofolioState>(
                  builder: (_, state) => (state is PortofolioLoadedDropdown)
                      ? DropdownButton(
                        hint: Text('Pilih portofolio anda',style: GoogleFonts.poppins(color: "8D92A3".toColor(), fontSize: 14, fontWeight: FontWeight.w400)),
                          value: selectedPortofolio,
                          isExpanded: true,
                          underline: SizedBox(),
                          items: state.dropdown
                              .map((e) => DropdownMenuItem(
                                  value: e.id,
                                  child: Text(e.name, style: blackFontStyle2)))
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              selectedPortofolio = item;
                            });
                          },
                        )
                      : Center(
                          child: loadingIndicator,
                        )),
            ),
            Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: isLoading
                    ? loadingIndicator
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          primary: blueColor1,
                        ),
                        child: Text(
                          'Simpan',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (selectedPortofolio == null ||
                              nominalController.text == "" ||
                              tanggalController.text == "") {
                            Alert(
                              context: context,
                              type: AlertType.error,
                              title: "Gagal",
                              desc: "Silahkan lengkapi form",
                              buttons: [
                                DialogButton(
                                    child: Text(
                                      "Ya",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: "3366FF".toColor()),
                              ],
                            ).show();
                          } else {
                            var data = Transactions(
                              portofolioId: selectedPortofolio.toInt(),
                              nominal: nominalController.text.toInt(),
                              tanggal: DateFormat("yyyy-MM-dd")
                                  .parse(tanggalController.text),
                              debitOrKredit: 1,
                            );

                            setState(() {
                              isLoading = true;
                            });
                            await context
                                .read<TransactionsCubit>()
                                .submitTransactions(data);
                            TransactionsState state =
                                context.read<TransactionsCubit>().state;

                            if (state is TransactionsLoaded) {
                              context.read<MySavingsCubit>().getSavings();
                              context
                                  .read<TransactionsCubit>()
                                  .getTransactions();
                              Get.back();
                            }
                          }
                        })),
          ],
        ),
      ),
    );
  }
}
