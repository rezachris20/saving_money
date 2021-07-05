part of 'pages.dart';

class SetTargetPage extends StatefulWidget {
  @override
  _SetTargetPageState createState() => _SetTargetPageState();
}

class _SetTargetPageState extends State<SetTargetPage> {
  TextEditingController nominalController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    context.read<PortofolioCubit>().getDropdown();
    return GeneralPage(
      title: "Target Tabungan",
      subtitle: "Set target tabungan anda",
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
                          if (nominalController.text == "") {
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
                            var data = Portofolio(
                              target: nominalController.text.toInt(),
                            );

                            setState(() {
                              isLoading = true;
                            });
                            await context
                                .read<PortofolioCubit>()
                                .submitTarget(data);
                            
                              context.read<MySavingsCubit>().getSavings();
                              context.read<TransactionsCubit>().getTransactions();
                              Get.back();
                            
                          }
                        })),
          ],
        ),
      ),
    );
  }
}
