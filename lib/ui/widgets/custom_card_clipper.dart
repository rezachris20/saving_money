part of 'widgets.dart';

class CustomCardClipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(children: [
        Center(
          child: Container(
            width: 315,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: "ADC8FF".toColor()),
          ),
        ),
        Center(
          child: ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              width: 315,
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: "84A9FF".toColor()),
            ),
          ),
        ),
        Center(
          child: ClipPath(
            clipper: MyCustomClipper1(),
            child: Container(
              width: 315,
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: "254EDB".toColor()),
            ),
          ),
        ),
        Center(
          child: ClipPath(
            clipper: MyCustomClipper1(),
            child: Container(
              width: 315,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red),
            ),
          ),
        ),
      ]),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
    // ..lineTo(0, size.height)
    // ..lineTo(30, size.height)
    // ..quadraticBezierTo(
    //     size.width / 2, size.height - 100, size.width - 30, size.height)
    // ..lineTo(size.width , size.height)
    // ..lineTo(size.width, 0)
    ..lineTo(0, 0)
    ..lineTo(size.width / 2 - 90, 0)
    ..quadraticBezierTo(size.width /2, size.height - 100, size.width / 2 + 90 , 0)
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyCustomClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
    // ..lineTo(0, size.height)
    // ..lineTo(30, size.height)
    // ..quadraticBezierTo(
    //     size.width / 2, size.height - 100, size.width - 30, size.height)
    // ..lineTo(size.width , size.height)
    // ..lineTo(size.width, 0)
    ..lineTo(0, 0)
    ..lineTo(size.width / 2 - 140, 0)
    ..quadraticBezierTo(size.width /2, size.height - 50, size.width / 2 + 140 , 0)
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
