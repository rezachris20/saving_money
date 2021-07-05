part of 'pages.dart';

var list = ['Edit Profile', 'List Keluarga', 'Kode Keluarga', 'Keluar Aplikasi'];

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(children: [
          SizedBox(height: 26),
          Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 220,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: defaultMargin),
              color: whiteColor1,
              child: Column(children: [
                Container(
                  height: 110,
                  width: 110,
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/photo_border.png'))),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                (context.watch<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath))),
                  ),
                ),
                Text(
                  (context.bloc<UserCubit>().state as UserLoaded).user.name,
                  style: blackFontStyle1.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  (context.bloc<UserCubit>().state as UserLoaded).user.email,
                  style: grayFontStyle1.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ])),
          Container(
            width: double.infinity,
            color: whiteColor1,
            child: Column(
                children: list
                    .map((e) => GestureDetector(
                          onTap: () {
                            if (list.indexOf(e) == 3) {
                              Alert(
                                context: context,
                                type: AlertType.info,
                                title: "Keluar Aplikasi",
                                desc:
                                    "Apakah anda yakin akan keluar dari aplikasi?",
                                buttons: [
                                  DialogButton(
                                      child: Text(
                                        "Tidak",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      color: "84A9FF".toColor()),
                                  DialogButton(
                                      child: Text(
                                        "Ya",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      onPressed: () async {
                                        await context
                                            .read<UserCubit>()
                                            .signOut();
                                        UserState state =
                                            context.read<UserCubit>().state;

                                        if (state is UserSignout) {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.clear();
                                          Get.offAll(SignInPage());
                                        }
                                      },
                                      color: "3366FF".toColor())
                                ],
                              ).show();
                            } else if (list.indexOf(e) == 2) {
                              Get.to(CodeFamilyPage());
                            } else if (list.indexOf(e) == 1){
                              Get.to(ListFamilyPage());
                            } else {
                              Get.to(MyProfilePage());
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 16,
                                left: defaultMargin,
                                right: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e,
                                  style: blackFontStyle1,
                                ),
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    'assets/right_arrow.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList()),
          ),
        ]),
      ],
    );
  }
}
