import 'package:flutter/material.dart';
import 'package:ehr_mobile/model/constraints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/textinputfield.dart';
import '../components/pagebutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ehr_mobile/view/screens/database_service.dart';
import 'package:ehr_mobile/view/screens/LoginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService _databaseService = DatabaseService();
  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Call signUpUser method from DatabaseService
      bool signUpSuccess = await _databaseService.signUpUser(
        nameController.text,
        emailController.text,
        passwordController.text,
      );

      if (signUpSuccess) {
        // Show success message and navigate to LoginPage
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Successfully signed up!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up. Please try again later.')),
        );
      }
    } catch (e) {
      String errorMessage = 'An error occurred. Please try again.';
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email address is not valid.';
        } else {
          errorMessage = 'Failed to create user: ${e.message}';
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
                    'Nomor ID',
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
                  controller: nameController,
                  hintText: 'SRP001',
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
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
                  controller: emailController,
                  hintText: 'johndoe@gmail.com',
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
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
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true, // Hide password input
                ),
                SizedBox(height: 56),
                _isLoading
                    ? CircularProgressIndicator()
                    : PageButton(
                        text: 'Daftar',
                        onTap: _signUp,
                      ),
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
                        Navigator.push(
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
}
