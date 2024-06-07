import 'package:flutter/material.dart';
import '../components/navbar.dart';
import '../components/textinputfield.dart';
import '../components/pagebutton.dart';
import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/main.dart';

class Editprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profil'),
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
        body: _EditprofileScreen(),
        bottomNavigationBar: Navbar(
          onTap: (index) {
            // Handle navigation index change
          },
          currentIndex: 2, // Set initial index
        ),
      ),
    );
  }
}

class _EditprofileScreen extends StatefulWidget {
  @override
  __EditprofileScreenState createState() => __EditprofileScreenState();
}

class __EditprofileScreenState extends State<_EditprofileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _bpjsController = TextEditingController();
  final TextEditingController _satuSehatController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
            hintText: 'Nomor ID',
            controller: _idController,
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
            hintText: 'Nomor Telepon',
            controller: _phoneController,
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
          TextInputField(
            hintText: 'Email',
            controller: _emailController,
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dobController.text) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}
