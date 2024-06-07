import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/navbar.dart';
import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/main.dart';

class Pemeriksaan extends StatefulWidget {
  const Pemeriksaan({Key? key}) : super(key: key);

  @override
  State<Pemeriksaan> createState() => _PemeriksaanState();
}

class _PemeriksaanState extends State<Pemeriksaan> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: AppColor.kTextColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main()),
                  );
                },
              ),
              SizedBox(width: 5), // Add spacing between arrow icon and text
              Padding(
                padding: const EdgeInsets.only(
                    left: 35.0), // Add left padding before the text
                child: Text(
                  "Pemeriksaan",
                  style: GoogleFonts.albertSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 2), // Add spacing between app bar and container
          Center(
            child: Card(
              color: AppColor.kButtonColor,
              margin: EdgeInsets.symmetric(horizontal: 35.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.albertSans(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Text(
                          "Gender",
                          style: GoogleFonts.albertSans(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          "Age",
                          style: GoogleFonts.albertSans(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              children: [
                Text(
                  "Informasi Pasien",
                  style: GoogleFonts.albertSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  icon: Icon(
                    Icons.edit_rounded,
                    size: 20,
                    color: AppColor.kTextColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Main()),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: _buildPatientInfoSection(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildStatusSection(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildStatusCard(),
          ),
          SizedBox(height: 40),
        ],
      ),
      bottomNavigationBar: Navbar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }

  Widget _buildPatientInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow("NIK", "0000010101010101"),
                  _buildInfoRow("Tanggal Lahir", "12/12/2000"),
                  _buildInfoRow("ID Satu Sehat", "0000010101010101"),
                ],
              ),
            ),
            SizedBox(width: 1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow("Nomor Telepon", "0896xxxxxxx"),
                  _buildInfoRow("Nomor BPJS", "0000010101010101"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: GoogleFonts.albertSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.albertSans(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Status Pasien",
          style: GoogleFonts.albertSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: ElevatedButton.icon(
            onPressed: () {
              // Handle add status action
            },
            icon: Icon(Icons.add, size: 16, color: Colors.white),
            label: Text(
              "Tambah Patient",
              style: GoogleFonts.albertSans(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.kButtonColor,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.kButtonColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatusHeader(),
              SizedBox(height: 10),
              _buildStatusDetail(
                  "Keluhan", "Tiba-tiba tensi naik dan sakit kepala"),
              SizedBox(height: 10),
              _buildStatusDetail("Keterangan",
                  "Tadi sudah diberikan infus, tolong dicek kembali beberapa saat lagi"),
              SizedBox(height: 10),
              _buildStatusFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "20/05/2024",
              style: GoogleFonts.albertSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "20:10:15",
              style: GoogleFonts.albertSans(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(0.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.kButtonColor, // Set border color to blue
              width: 1.5, // Set border width
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              // Handle arrow action
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatusDetail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.albertSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.kOffButtonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            value,
            style: GoogleFonts.albertSans(fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatusFooterDetail("PIC", "Angelika Alimin"),
        _buildStatusFooterDetail("Jadwal Lanjutan", "22/05/2024"),
      ],
    );
  }

  Widget _buildStatusFooterDetail(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.albertSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(10),
          width: 120,
          decoration: BoxDecoration(
            color: AppColor.kOffButtonColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            value,
            style: GoogleFonts.albertSans(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
