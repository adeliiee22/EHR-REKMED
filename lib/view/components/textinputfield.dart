import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "../../model/constraints.dart";

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  TextInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.albertSans(
          textStyle: TextStyle(
            fontSize: 14,
            color: AppColor.kTextColor.withOpacity(0.5),
          ),
        ),
        filled: true,
        fillColor: AppColor.kOffButtonColor,
        // Border around the textfield
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.kButtonColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
