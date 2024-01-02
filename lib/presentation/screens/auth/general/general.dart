part of 'general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int _currentIndex = 0; // Use a more descriptive name for clarity

  @override
  Widget build(BuildContext context) {
    List<TabItem> items = [
      const TabItem(
        icon: FeatherIcons.home,
      ),
      const TabItem(
        icon: FeatherIcons.plus,
      ),
      const TabItem(
        icon: FeatherIcons.hash,
      ),
      const TabItem(
        icon: FeatherIcons.user,
      ),
    ];

    List<Widget> pages = [
      const Home(),
      const AddPosts(),
      const Tags(),
      const Profile(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomBarCreative(
        items: items,
        backgroundColor: Colors.white,
        color: MyColors.appcolor.withOpacity(0.6),
        colorSelected: MyColors.appcolor,
        indexSelected: _currentIndex,
        onTap: (int index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}
