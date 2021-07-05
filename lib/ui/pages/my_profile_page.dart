part of 'pages.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  User user;
  File pictureFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    nameController.text =
        (context.read<UserCubit>().state as UserLoaded).user.name;
    emailController.text =
        (context.read<UserCubit>().state as UserLoaded).user.email;
    phoneNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.phoneNumber;
    addressController.text =
        (context.read<UserCubit>().state as UserLoaded).user.address;
    houseNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.houseNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Get.to(MainPage(initalPage: 3));
      },
          child: GeneralPage(
        title: "Edit Profile",
        subtitle: "Isi form apabila ingin merubah data",
        onBackButtonPressed: () {
          Get.to(MainPage(initalPage: 3));
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
                                  image: NetworkImage((context.bloc<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath),
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
                  "Nomor telepon",
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
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: grayFontStyle2,
                      hintText: "Ketik nomor telepon anda"),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
                child: Text(
                  "Alamat",
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
                  controller: addressController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: grayFontStyle2,
                      hintText: "Ketik alamat anda"),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
                child: Text(
                  "Nomor rumah",
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
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: grayFontStyle2,
                      hintText: "Ketik nomor rumah anda"),
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
                            setState(() {
                              isLoading = true;
                            });

                            if (nameController.text == "" ||
                                emailController.text == "" ||
                                phoneNumberController.text == "" ||
                                houseNumberController.text == "" ||
                                addressController.text == "") {
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
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              User user = User(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phoneNumber: phoneNumberController.text,
                                  address: addressController.text,
                                  houseNumber: houseNumberController.text);

                              var result = await context
                                  .read<UserCubit>()
                                  .editProfile(user,pictureFile: pictureFile);

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
                                      "Profile berhasil di rubah",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ));
                                setState(() {
                                  isLoading = false;
                                });
                                
                              }
                            }
                          })),
            ],
          ),
        ),
      ),
    );
  }
}
