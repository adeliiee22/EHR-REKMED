import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Make sure to replace this with your actual Firebase options file

import 'package:ehr_mobile/view/screens/DaftarPemeriksaan.dart';
import 'package:ehr_mobile/view/screens/EditPasien.dart';
import 'package:ehr_mobile/view/screens/EditProfile.dart';
import 'package:ehr_mobile/view/screens/LoginPage.dart';
import 'package:ehr_mobile/view/screens/ProfilePerawat.dart';
import 'package:ehr_mobile/view/screens/main.dart';
import 'package:ehr_mobile/view/screens/pemeriksaan.dart';
import 'package:ehr_mobile/view/screens/TambahPasien.dart';
import 'package:ehr_mobile/view/screens/TambahStatus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      appId: DefaultFirebaseOptions.currentPlatform.appId,
      apiKey: DefaultFirebaseOptions.currentPlatform.apiKey,
      messagingSenderId: DefaultFirebaseOptions.currentPlatform.messagingSenderId,
      projectId: DefaultFirebaseOptions.currentPlatform.projectId,
      databaseURL: DefaultFirebaseOptions.currentPlatform.databaseURL,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REKMED',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Set initial route to LoginPage
      routes: {
        '/login': (context) => LoginPage(),
        '/tambahStatus': (context) => TambahStatus(),
        '/main': (context) => Main(),
        '/daftarPemeriksaan': (context) => DaftarPemeriksaan(),
        '/editPasien': (context) => Editpasien(),
        '/editProfile': (context) => Editprofile(),
        '/profilePerawat': (context) => Profileperawat(),
        '/pemeriksaan': (context) => Pemeriksaan(),
        '/tambahPasien': (context) => TambahPasien(),
      },
    );
  }
}
