import 'package:flutter/material.dart';
import '../components/navbar.dart'; 
import '../components/textinputfield.dart'; 
import '../components/pagebutton.dart'; 
import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/main.dart';

class Editpasien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Pasien'),
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
        body: _EditpasienScreen(),
        bottomNavigationBar: Navbar(
          onTap: (index) {
            // Handle navigation index change
          },
          currentIndex: 0, // Set initial index
        ),
      ),
    );
  }
}

class _EditpasienScreen extends StatefulWidget {
  @override
  __EditpasienScreenState createState() => __EditpasienScreenState();
}

class __EditpasienScreenState extends State<_EditpasienScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _bpjsController = TextEditingController();
  final TextEditingController _satuSehatController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  DateTime? _selectedDate; // Variable to store selected date

  // Function to show date picker and update selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Update the text in your TextField accordingly
        _dobController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  final TextEditingController _dobController = TextEditingController(); // Controller for Date of Birth

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: AppColor.kOffButtonColor,
                  child: Icon(Icons.person, size: 100, color: AppColor.kOffTextColor),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Handle change photo action
                  },
                  child: Text('Ganti Foto', style: TextStyle(color: AppColor.kOffTextColor)),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Nama Lengkap',
            controller: _nameController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Nomor Telepon',
            controller: _phoneController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Jenis Kelamin',
            controller: _genderController,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    hintText: 'Tanggal Lahir',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextInputField(
                  hintText: 'Umur',
                  controller: _ageController,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'NIK',
            controller: _nikController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Nomor BPJS',
            controller: _bpjsController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'ID SatuSehat',
            controller: _satuSehatController,
          ),
          SizedBox(height: 16),
          PageButton(
            onTap: () {
              // Handle save action
            },
            text: 'Simpan',
          ),
        ],
      ),
    );
  }
}


