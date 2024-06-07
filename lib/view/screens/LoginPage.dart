import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:ehr_mobile/view/screens/main.dart';
import '../components/textinputfield.dart';
import '../components/pagebutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Main()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please check your credentials.')),
      );
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
                  alignment: Alignment.center,
                  child: Text(
                    'Selamat Datang!',
                    style: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        color: AppColor.kButtonColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
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
                  hintText: 'Email',
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
                  obscureText: true,
                ),
                SizedBox(height: 37),
                PageButton(
                  text: 'Masuk',
                  onTap: _login,
                ),
                SizedBox(height: 44),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tidak punya akun?',
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
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Daftar',
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
      // bottomNavigationBar: Navbar(
      //   onTap: _onItemTapped,
      //   currentIndex: _selectedIndex,
      // ),
    );
  }
}
