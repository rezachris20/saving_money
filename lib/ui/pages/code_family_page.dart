part of 'pages.dart';

class CodeFamilyPage extends StatefulWidget {
  @override
  _CodeFamilyPageState createState() => _CodeFamilyPageState();
}

class _CodeFamilyPageState extends State<CodeFamilyPage> {
  bool isLoading = false;
  String myCodeFamily = "${User.viewCodeFamily}";
  @override
  Widget build(BuildContext context) {
    context.read<PortofolioCubit>().getDropdown();
    return GeneralPage(
      title: "Kode Keluarga",
      subtitle: "Share kode ke istri atau anak anda",
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
              padding: EdgeInsets.only(top: 45),
              width: double.infinity,
              child: Center(
                child: Text("Kode Keluarga Anda",
                    style: blackFontStyle2.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(25, 38, 25, 20),
                width: double.infinity,
                height: 1,
                color: "B0B0B5".toColor()),
            Container(
              width: double.infinity,
              child: Center(
                child: SelectableText(myCodeFamily,
                    style: blackFontStyle2.copyWith(
                        fontSize: 30, fontWeight: FontWeight.w600)),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                width: double.infinity,
                height: 1,
                color: "B0B0B5".toColor()),
            SizedBox(height: MediaQuery.of(context).size.width),
            Container(
              width: double.infinity,
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: isLoading
                  ? loadingIndicator
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: blueColor1,
                      ),
                      child: Text(
                        'Generate ulang Kode Family',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        
                        var result = await context.read<UserCubit>().generateKodeFamily();

                        UserState state = context.read<UserCubit>().state;

                        if (state is UserLoaded) {
                          Get.snackbar("", "",
                            backgroundColor: "84A9FF".toColor(),
                            icon: Icon(
                              MdiIcons.checkOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sukses",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              "Kode berhasil di generate ulang",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ));
                          setState(() {
                            myCodeFamily = result;
                            isLoading = false;
                          });

                        }

                      }),
            ),
          ],
        ),
      ),
    );
  }
}
