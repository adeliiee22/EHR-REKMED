import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/constraints.dart';
import '../components/textinputfield.dart';
import 'LoginPage.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 320,
                  image: AssetImage('images/rekmed.png'),
                ),
                SizedBox(height: 56),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password Baru',
                    style: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextInputField(
                  controller: newPasswordController,
                  hintText: 'Masukkan password baru',
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Konfirmasi Password Baru',
                    style: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextInputField(
                  controller: confirmNewPasswordController,
                  hintText: 'Konfirmasi password baru',
                ),
                SizedBox(height: 56),
                SizedBox(height: 44),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah memiliki akun?',
                      style: GoogleFonts.albertSans(
                        textStyle: TextStyle(
                          color: AppColor.kTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Masuk',
                        style: GoogleFonts.albertSans(
                          textStyle: TextStyle(
                            color: AppColor.kButtonColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _resetPassword() {
    String newPassword = newPasswordController.text;
    String confirmNewPassword = confirmNewPasswordController.text;

    if (newPassword.isEmpty || confirmNewPassword.isEmpty) {
      _showErrorDialog('Password tidak boleh kosong.');
      return;
    }

    if (newPassword != confirmNewPassword) {
      _showErrorDialog('Password dan konfirmasi password tidak sesuai.');
      return;
    }

    // Placeholder for your reset password logic
    // Replace with your own logic, e.g., API call, database update, etc.

    // Navigate to login page after successful password reset
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
