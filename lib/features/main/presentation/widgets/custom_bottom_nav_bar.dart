import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/utils/app_imports.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: currentIndex,
      onTap: (i) => setState(() => currentIndex = i),
      selectedItemColor: Color(0xff1B5E37),
      unselectedItemColor: Color(0xff4E5556),
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("الرئيسية"),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.dashboard),
          title: Text("المنتجات"),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("السلة"),
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("حسابي"),
        ),
      ],
    );
  }
}
