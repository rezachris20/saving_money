part of 'pages.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool isHide;

  _SplashScreenPageState({this.isHide = true});

  @override
  void initState() {
    checkLogin(context);
    super.initState();
  }

  Future checkLogin(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString('email');
    String password = preferences.getString('password');
    print(email);
    print(password);
    if (email != null && password != null) {
      await context.read<UserCubit>().signIn(email, password);
      UserState state = context.read<UserCubit>().state;
      if (state is UserLoaded) {
        context.read<TransactionsCubit>().getTransactions();
        context.read<MySavingsCubit>().getSavings();
        Get.offAll(MainPage());
      }
      setState(() {
        isHide = true;
      });
    } else {
      setState(() {
        isHide = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor1,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.only(top: 127),
            child: Image(
              image: AssetImage('assets/money1.png'),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2 * 0.1,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.fromLTRB(26, 33, 27, 36),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                Text(
                  'Selamat Datang!',
                  style: blackFontStyle1.copyWith(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                Text(
                  'Selamat datang di Aplikasi Saving Money,\ncara mudah untuk meningkatkan keuangan Anda dan membantu Anda mengontrol pengeluaran dan pendapatan',
                  style: grayFontStyle1.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 2 * 0.1),
                (!isHide)
                    ? Container(
                        height: 50,
                        width: 153,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(SignInPage());
                            },
                            style: ElevatedButton.styleFrom(
                              primary: blueColor1,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              'Mulai',
                              style: whiteFontStyle1.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )))
                    : SizedBox()
              ],
            ),
          )
        ]),
      ),
    );
  }
}
