part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initalPage;

  MainPage({this.initalPage = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initalPage;
    pageController = PageController(initialPage: widget.initalPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor1,
      body: Stack(
        children: [
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                HomePage(),
                PortofolioPage(),
                // Center(child: Text('Comming Soon!', style: blackFontStyle1)),
                ProfilePage(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
                selectedIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(selectedPage);
                }),
          )
        ],
      ),
    );
  }
}
