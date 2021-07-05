part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File pictureFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Akun Baru",
      subtitle: "Buat akun baru anda",
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
            GestureDetector(
              onTap: () async {
                PickedFile pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  pictureFile = File(pickedFile.path);
                  setState(() {});
                }
              },
              child: Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(top: 26),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/photo_border.png'))),
                child: (pictureFile != null)
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(pictureFile),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/photo.png'),
                                fit: BoxFit.cover)),
                      ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Nama Lengkap",
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
                    hintText: "Ketik nama lengkap anda"),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Alamat email",
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
                controller: emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: grayFontStyle2,
                    hintText: "Ketik alamat email anda"),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Password",
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
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: grayFontStyle2,
                    hintText: "Ketik password anda"),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Konfirmasi Password",
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
                obscureText: true,
                controller: confirmationPassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: grayFontStyle2,
                    hintText: "Ketik konfirmasi password anda"),
              ),
            ),
            Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      primary: blueColor1,
                    ),
                    child: Text(
                      'Lanjut',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (nameController.text == "" ||
                          emailController.text == "" ||
                          passwordController.text == "" ||
                          confirmationPassword.text == "") {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Gagal",
                          desc: "Silahkan lengkapi semua form",
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
                      } else if (passwordController.text !=
                          confirmationPassword.text) {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Gagal",
                          desc:
                              "Konfirmasi password tidak sama dengan password",
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
                        Get.to(AddressPage(
                            User(
                                name: nameController.text,
                                email: emailController.text),
                            passwordController.text,
                            confirmationPassword.text,
                            pictureFile));
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
