import 'package:flutter/material.dart';
import 'package:ehr_mobile/model/constraints.dart';
import 'package:google_fonts/google_fonts.dart';

class PageButton extends StatelessWidget {
  const PageButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.kButtonColor,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: GoogleFonts.albertSans(
              textStyle: TextStyle(
            color: AppColor.kBackgroundColor,
            fontSize: 14,
          )),
        ),
      ),
    );
  }
}
