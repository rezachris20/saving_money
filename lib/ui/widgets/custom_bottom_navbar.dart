part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavbar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/home' +
                              ((selectedIndex == 0) ? '.png' : '_normal.png')),
                          fit: BoxFit.contain)),
                ),
                Text(
                  'Home',
                  style: (selectedIndex == 0)
                      ? blueFontStyle1.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500)
                      : grayFontStyle1.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/portofolio' +
                              ((selectedIndex == 1) ? '.png' : '_normal.png')),
                          fit: BoxFit.contain)),
                ),
                Text(
                  'Portofolio',
                  style: (selectedIndex == 1)
                      ? blueFontStyle1.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500)
                      : grayFontStyle1.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),

          // GestureDetector(
          //   onTap: () {
          //     if (onTap != null) {
          //       onTap(2);
          //     }
          //   },
          //   child: Column(
          //     children: [
          //       Container(
          //         width: 32,
          //         height: 32,
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage('assets/support' +
          //                     ((selectedIndex == 2) ? '.png' : '_normal.png')),
          //                 fit: BoxFit.contain)),
          //       ),
          //       Text(
          //         'Support',
          //         style: (selectedIndex == 2)
          //             ? blueFontStyle1.copyWith(
          //                 fontSize: 10, fontWeight: FontWeight.w500)
          //             : grayFontStyle1.copyWith(
          //                 fontSize: 10, fontWeight: FontWeight.w500),
          //       )
          //     ],
          //   ),
          // ),

          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/profile' +
                              ((selectedIndex == 3) ? '.png' : '_normal.png')),
                          fit: BoxFit.contain)),
                ),
                Text(
                  'Profile',
                  style: (selectedIndex == 2)
                      ? blueFontStyle1.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500)
                      : grayFontStyle1.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
