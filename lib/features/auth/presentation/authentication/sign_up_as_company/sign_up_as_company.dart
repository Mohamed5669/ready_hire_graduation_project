import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import '../../../../../core/routes_manager/routes_manager.dart';


class SignUpAsCompany extends StatefulWidget {
  @override
  _SignUpAsCompanyState createState() => _SignUpAsCompanyState();
}

class _SignUpAsCompanyState extends State<SignUpAsCompany> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController linkedinController =
  TextEditingController(); // حقل LinkedIn

  File? _image;
  String? _uploadedFileName;
  String? selectedGender;
  String selectedCountryCode = '+20 ';
  String selectedFlag = '🇪🇬';

  final ImagePicker _picker = ImagePicker();

  final List<Map<String, String>> countries = [
    {'flag': '🇪🇬', 'code': '+20 '},
    {'flag': '🇺🇸', 'code': '+1 '},
    {'flag': '🇬🇧', 'code': '+44 '},
    {'flag': '🇸🇦', 'code': '+966 '},
    {'flag': '🇮🇳', 'code': '+91 '},
  ];

  bool isButtonEnabled = false;

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = fullNameController.text.isNotEmpty &&
          nickNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          dateController.text.isNotEmpty &&
          linkedinController.text.isNotEmpty;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _uploadedFileName = result.files.single.name;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text =
        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
        _updateButtonState();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fullNameController.addListener(_updateButtonState);
    nickNameController.addListener(_updateButtonState);
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
    phoneController.addListener(_updateButtonState);
    dateController.addListener(_updateButtonState);
    linkedinController.addListener(_updateButtonState); // مراقبة حقل LinkedIn
  }

  @override
  void dispose() {
    fullNameController.dispose();
    nickNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    dateController.dispose();
    linkedinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill your Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.camera_alt, color: Colors.white, size: 30)
                        : null,
                  ),
                ),
                SizedBox(height: 20),

                buildTextField(
                  controller: fullNameController,
                  labelText: 'Company Name',
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 15),
                buildTextField(
                  controller: nickNameController,
                  labelText: 'Company Website',
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(height: 15),
                buildTextField(
                  controller: dateController,
                  labelText: 'Date of Establishment',
                  prefixIcon: Icons.cake,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  suffixIcon: Icons.calendar_today,
                ),
                SizedBox(height: 15),
                buildTextField(
                  controller: emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15),
                buildTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 15),

                buildTextField(
                  controller: linkedinController,
                  labelText: 'LinkedIn Profile',
                  prefixIcon: Icons.link,
                  inputType: TextInputType.url,
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: _pickFile,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.attach_file, color: Colors.grey),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              _uploadedFileName ??
                                  'Upload Company Data',
                              overflow: TextOverflow
                                  .ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedFlag,
                      onChanged: (newFlag) {
                        setState(() {
                          selectedFlag = newFlag!;
                          selectedCountryCode = countries.firstWhere(
                                  (country) =>
                              country['flag'] == newFlag)['code']!;
                          _updateButtonState();
                        });
                      },
                      items: countries
                          .map((country) =>
                          DropdownMenuItem<String>(
                            value: country['flag'],
                            child: Text(
                              country['flag']!,
                              style: TextStyle(fontSize: 24),
                            ),
                          ))
                          .toList(),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: buildTextField(
                        controller: phoneController,
                        labelText: 'Phone',
                        prefixText: selectedCountryCode,
                        inputType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),


                ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, RoutesManager.signIn);
                    }
                  }
                      : null,
                  child: Text(
                    'Continue', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor:
                    isButtonEnabled ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    String? prefixText,
    TextInputType? inputType,
    bool obscureText = false,
    bool readOnly = false,
    Function()? onTap,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: buildInputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
      ),
      keyboardType: inputType,
      obscureText: obscureText,
    );
  }

  InputDecoration buildInputDecoration({
    required String labelText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    String? prefixText,
  }) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      prefixText: prefixText,
    );
  }
}
