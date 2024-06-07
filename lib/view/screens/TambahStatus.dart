import 'package:flutter/material.dart';
import '../components/navbar.dart'; 
import '../components/textinputfield.dart'; 
import '../components/pagebutton.dart'; 
import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/main.dart';

class TambahStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tambah Status'),
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
        body: _TambahStatusScreen(),
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

class _TambahStatusScreen extends StatefulWidget {
  @override
  __TambahStatusScreenState createState() => __TambahStatusScreenState();
}

class __TambahStatusScreenState extends State<_TambahStatusScreen> {
  final TextEditingController _tanggalPemeriksaanController = TextEditingController();
  final TextEditingController _waktuPemeriksaanController = TextEditingController();
  final TextEditingController _namaDokterController = TextEditingController();
  final TextEditingController _beratBadanController = TextEditingController();
  final TextEditingController _tinggiBadanController = TextEditingController();
  final TextEditingController _tekananDarahController = TextEditingController();
  final TextEditingController _temperaturController = TextEditingController();
  final TextEditingController _keluhanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final TextEditingController _obatController = TextEditingController();
  final TextEditingController _jadwalKunjunganLanjutanController = TextEditingController();
  DateTime? _selectedDate; // Variable to store selected date
  TimeOfDay? _selectedTime; // Variable to store selected time
  DateTime? _selectedJadwalKunjunganLanjutanDate; // Variable to store selected date for Jadwal Kunjungan Lanjutan

  // Function to show date picker and update selected date
  Future<void> _selectDate(BuildContext context, TextEditingController controller, bool isJadwalKunjunganLanjutan) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isJadwalKunjunganLanjutan ? _selectedJadwalKunjunganLanjutanDate ?? DateTime.now() : _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isJadwalKunjunganLanjutan) {
          _selectedJadwalKunjunganLanjutanDate = picked;
          controller.text = '${picked.day}/${picked.month}/${picked.year}';
        } else {
          _selectedDate = picked;
          controller.text = '${picked.day}/${picked.month}/${picked.year}';
        }
      });
    }
  }

  // Function to show time picker and update selected time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _waktuPemeriksaanController.text = '${picked.hour}:${picked.minute}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _tanggalPemeriksaanController,
                  readOnly: true,
                  onTap: () => _selectDate(context, _tanggalPemeriksaanController, false),
                  decoration: InputDecoration(
                    hintText: 'Tanggal Pemeriksaan',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, _tanggalPemeriksaanController, false),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _waktuPemeriksaanController,
                  readOnly: true,
                  onTap: () => _selectTime(context),
                  decoration: InputDecoration(
                    hintText: 'Waktu Pemeriksaan',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () => _selectTime(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Nama Dokter',
            controller: _namaDokterController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Berat Badan',
            controller: _beratBadanController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Tinggi Badan',
            controller: _tinggiBadanController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Tekanan Darah',
            controller: _tekananDarahController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Temperatur',
            controller: _temperaturController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Keluhan',
            controller: _keluhanController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Keterangan',
            controller: _keteranganController,
          ),
          SizedBox(height: 16),
          TextInputField(
            hintText: 'Obat',
            controller: _obatController,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _jadwalKunjunganLanjutanController,
            readOnly: true,
            onTap: () => _selectDate(context, _jadwalKunjunganLanjutanController, true),
            decoration: InputDecoration(
              hintText: 'Jadwal Kunjungan Lanjutan',
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context, _jadwalKunjunganLanjutanController, true),
              ),
            ),
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
