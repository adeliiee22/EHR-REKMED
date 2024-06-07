import 'package:flutter/material.dart';
import '../components/navbar.dart';
import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/main.dart';

class Profileperawat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Perawat'),
        backgroundColor: AppColor.kBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Main()),
              );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: AppColor.kButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 64.0,
                      height: 64.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 40.0,
                        color: AppColor.kOffButtonColor,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jessie Yoww',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'SRP001',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Perempuan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informasi Detail',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.edit, color: AppColor.kTextColor),
              ],
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.black),
            SizedBox(height: 8.0),
            ProfileDetailItem(label: 'NIK', value: '00000101010101'),
            ProfileDetailItem(label: 'Nomor Telepon', value: '0896xxxxxxxx'),
            ProfileDetailItem(label: 'Tanggal Lahir', value: '12/12/1999'),
            ProfileDetailItem(label: 'Nomor BPJS', value: '00000101010101'),
            ProfileDetailItem(label: 'Email', value: 'jessieyow@rs.pantirapih.com'),
            ProfileDetailItem(label: 'ID Satu Sehat', value: '00000101010101'),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(
        onTap: (index) {
          // Handle navigation index change
        },
        currentIndex: 2, // Assuming 'Profil' is the selected tab
      ),
    );
  }
}

class ProfileDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
