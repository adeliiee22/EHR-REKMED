import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ehr_mobile/model/constraints.dart';

class Navbar extends StatefulWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;

  const Navbar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assignment_rounded,
            color: widget.currentIndex == 0
                ? Colors.white
                : AppColor.kOffTextColor,
          ),
          label: 'Pemeriksaan',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: widget.currentIndex == 1
                ? Colors.white
                : AppColor.kOffTextColor,
          ),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_rounded,
            color: widget.currentIndex == 2
                ? Colors.white
                : AppColor.kOffTextColor,
          ),
          label: 'Profil',
        ),
      ],
      currentIndex: widget.currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColor.kOffTextColor,
      backgroundColor: AppColor.kButtonColor,
      onTap: widget.onTap,
      selectedLabelStyle: GoogleFonts.albertSans(color: Colors.white),
      unselectedLabelStyle:
          GoogleFonts.albertSans(color: AppColor.kOffTextColor),
    );
  }
}
