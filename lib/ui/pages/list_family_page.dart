part of 'pages.dart';

class ListFamilyPage extends StatefulWidget {
  @override
  _ListFamilyPageState createState() => _ListFamilyPageState();
}

class _ListFamilyPageState extends State<ListFamilyPage> {
  TextEditingController familyCodeController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    context.read<ListFamilyCubit>().getList();

    return GeneralPage(
      title: "List Keluarga",
      subtitle: "keluarga yang terdaftar di sistem",
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
          child: BlocBuilder<ListFamilyCubit, ListFamilyState>(
            builder: (_, state) => (state is ListFamilyLoaded)
                ? Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.listFamily.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = state.listFamily[index];
                          return CardListFamily(
                            listFamily: item,
                          );
                        }),
                  )
                : Center(child: loadingIndicator),
          )),
    );
  }
}
