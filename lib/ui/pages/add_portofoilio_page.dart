part of 'pages.dart';

class AddPortofolioPage extends StatefulWidget {
  @override
  _AddPortofolioPageState createState() => _AddPortofolioPageState();
}

class _AddPortofolioPageState extends State<AddPortofolioPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController goalSavingController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Buat Portofolio",
      subtitle: "Set target anda",
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
                "Nama Target",
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
                controller: nameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: grayFontStyle2,
                    hintText: "Ketik nama target anda"),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Nominal Target",
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
                keyboardType: TextInputType.number,
                controller: goalSavingController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: grayFontStyle2,
                    hintText: "Set nominal target anda"),
              ),
            ),
            Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: isLoading
                    ? loadingIndicator
                    : RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: blueColor1,
                        child: Text(
                          'Simpan',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (nameController.text == "" ||
                              goalSavingController.text == "") {
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
                            setState(() {
                              isLoading = true;
                            });

                            var data = Portofolio(
                                name: nameController.text,
                                target: goalSavingController.text.toInt());

                            await context
                                .read<PortofolioCubit>()
                                .addNewPortofolio(data);
                            PortofolioState state =
                                context.read<PortofolioCubit>().state;

                            if (state is PortofolioLoaded) {
                              context.read<PortofolioCubit>().getPortofolio();
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
