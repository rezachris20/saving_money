part of 'widgets.dart';

class CardListFamily extends StatelessWidget {
  final ListFamily listFamily;

  CardListFamily({this.listFamily});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Text(
            (listFamily.coreStatusId == 1)
                ? 'Suami'
                : (listFamily.coreStatusId == 2)
                    ? 'Istri'
                    : 'Anak',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: "B0B0B5".toColor()),
          ),
        ),
        SizedBox(height: 5),
        Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            height: 1,
            color: "B0B0B5".toColor()),
        SizedBox(height: 15),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Nama",
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: "B0B0B5".toColor()),
                ),
              ),
              Container(
                  child: Text(
                listFamily.name,
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: "36385".toColor()),
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Alamat",
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: "B0B0B5".toColor()),
                ),
              ),
              Container(
                  child: Text(
                listFamily.address + " " + listFamily.houseNumber,
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: "36385".toColor()),
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Nomor HP",
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: "B0B0B5".toColor()),
                ),
              ),
              Container(
                  child: Text(
                listFamily.phoneNumber,
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: "36385".toColor()),
              ))
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            height: 1,
            color: "B0B0B5".toColor()),
        SizedBox(height: 15),
      ],
    );
  }
}
