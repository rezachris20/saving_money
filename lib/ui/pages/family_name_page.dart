part of 'pages.dart';

class FamilyNamePage extends StatefulWidget {
  final User user;
  final String password;
  final String confirmPassword;

  final File pictureFile;

  FamilyNamePage(this.user, this.password, this.confirmPassword, this.pictureFile);

  @override
  _FamilyNamePageState createState() => _FamilyNamePageState();
}

class _FamilyNamePageState extends State<FamilyNamePage> {
  TextEditingController familynameController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Nama Keluarga",
      subtitle: "Set nama keluarga anda",
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
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 0),
              child: Text(
                "Nama Keluarga",
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
                controller: familynameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: grayFontStyle2,
                    hintText: "Ketik nama keluarga anda"),
              ),
            ),
            
            Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: isLoading ? loadingIndicator : RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: blueColor1,
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          User user = widget.user.copyWith(familyName: familynameController.text);

                          await context.read<UserCubit>().signUp(user, widget.password, widget.confirmPassword,pictureFile: widget.pictureFile);

                          UserState state = context.read<UserCubit>().state;

                          if(state is UserLoaded){
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('email', widget.user.email);
                            prefs.setString('password', widget.password);

                            context.read<TransactionsCubit>().getTransactions();
                            context.read<MySavingsCubit>().getSavings();
                            Get.offAll(MainPage());
                          } else {
                            Get.snackbar("", "",
                                backgroundColor: "D9435E".toColor(),
                                icon: Icon(MdiIcons.closeCircleOutline,
                                    color: Colors.white),
                                titleText: Text(
                                  "Daftar Gagal",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                messageText: Text(
                                    (state as UserLoadingFailed).message,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white)));
                            setState(() {
                              isLoading = false;
                            });
                          }
                        })),
          ],
        ),
      ),
    );
  }
}
