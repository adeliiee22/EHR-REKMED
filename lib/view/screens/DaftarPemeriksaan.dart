import 'package:ehr_mobile/model/constraints.dart';
import 'package:flutter/material.dart';
import '../components/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class DaftarPemeriksaan extends StatelessWidget {
  static const Color kButtonColor = Color(0xFF003CC0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daftar Pemeriksaan'),
          titleTextStyle: GoogleFonts.albertSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: _DaftarPemeriksaanScreen(),
        bottomNavigationBar: Navbar(
          onTap: (index) {
            // Handle navigation index change
          },
          currentIndex: 0, // Set initial index
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 100,
              right: 16,
              child: Material(
                elevation: 4,
                shape: CircleBorder(),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.kBackgroundColor,
                  ),
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 28,
                        color: AppColor.kButtonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}



class _DaftarPemeriksaanScreen extends StatefulWidget {
  @override
  __DaftarPemeriksaanScreenState createState() =>
      __DaftarPemeriksaanScreenState();
      
}

class __DaftarPemeriksaanScreenState extends State<_DaftarPemeriksaanScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> doctors = [
    {"name": "Andrea Notokusumo", "gender": "Perempuan", "specialization": "Gizi, Umum"},
    {"name": "Kyle Abii", "gender": "Laki-laki", "specialization": "Umum, Anak, THT"},
    {"name": "Andreas Notokusumo", "gender": "Laki-laki", "specialization": "Ortodonsia, THT"},
    {"name": "Catherine Abii", "gender": "Perempuan", "specialization": "THT"},
  ];

  String? _selectedSpecialization;
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusColor: AppColor.kButtonColor,
              labelText: 'Nama Pasien, NIK, No. BPJS, ID SatuSehat',
              labelStyle: GoogleFonts.albertSans(color: AppColor.kTextColor),
              suffixIcon: Padding(
                padding: EdgeInsets.all(4),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.kButtonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),

          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedSpecialization,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: AppColor.kBackgroundColor,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColor.kButtonColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.medical_information_rounded, color: AppColor.kBackgroundColor),
                    ),
                  ),
                  dropdownColor: AppColor.kButtonColor,
                  style: GoogleFonts.albertSans(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: AppColor.kBackgroundColor,
                    ),
                  ),
                  iconEnabledColor: Colors.white,
                  hint: Center(
                    child: Text(
                      "Spesialisasi",
                      style: GoogleFonts.albertSans(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: AppColor.kBackgroundColor,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  items: <String>['Anak', 'Gigi', 'Gizi', 'Umum', 'THT']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSpecialization = newValue;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: AppColor.kBackgroundColor,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColor.kButtonColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.person, color: AppColor.kBackgroundColor),
                    ),
                  ),
                  dropdownColor: AppColor.kButtonColor,
                  style: GoogleFonts.albertSans(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: AppColor.kBackgroundColor,
                    ),
                  ),
                  iconEnabledColor: Colors.white,
                  hint: Center(
                    child: Text(
                      "Gender",
                      style: GoogleFonts.albertSans(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: AppColor.kBackgroundColor,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  items: <String>['Laki-laki', 'Perempuan']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15), // Add spacing between items
                  child: Container(
                    height: 114, // Increased height for the container
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kOffButtonColor,
                    ), // Set background color here
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 65, // Set the width of the square
                            height: 82, // Increased height for the white box
                            decoration: BoxDecoration(
                              color: AppColor.kBackgroundColor,
                              borderRadius: BorderRadius.circular(6), // Rounded edges
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  doctors[index]['name']!,
                                  style: GoogleFonts.albertSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  doctors[index]['gender']!,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.albertSans(
                                    fontSize: 14,
                                    color: AppColor.kTextColor,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Wrap(
                                  spacing: 4,
                                  children: doctors[index]['specialization']!
                                      .split(', ')
                                      .map((spec) => Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                                            decoration: BoxDecoration(
                                              color: AppColor.kBackgroundColor,
                                              borderRadius: BorderRadius.circular(2),
                                            ),
                                            child: Text(
                                              spec,
                                              style: TextStyle(
                                                color: AppColor.kTextColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6), // Adjust padding as needed
                            decoration: BoxDecoration(
                              color: AppColor.kBackgroundColor, // White background color
                              shape: BoxShape.circle, // Circular shape
                            ),
                            child: Icon(Icons.chevron_right, color: AppColor.kTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}