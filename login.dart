import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junkee/global.dart';
import 'package:junkee/otpverification.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> sendPhoneNumber(String phoneNumber) async {
    final url = Uri.parse('$baseurl/generate_otp');
    final response = await http.post(
      url,
      body: jsonEncode({'phone_number': phoneNumber}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Phone number sent successfully');
    } else {
      print('Failed to send phone number. Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
  children: [
    CustomPaint(
      size: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height * 0.6,
      ),
      painter: InclinedBorderPainter(),
    ),
    Positioned(
      top: 40, // Adjust the top position as needed
      left: 20, // Adjust the left position as needed
      child: Text(
        'What is your \nMobile Number?',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    Positioned(
      top: screenHeight * 0.3, // Adjust the top position as needed
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Please enter your phone number to use the service',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Container(
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 255, 255, 255),
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: TextField(
      controller: phoneNumberController,
      onChanged: (value) {
        // The entered phone number is automatically stored in phoneNumberController.text
      },
      keyboardType: TextInputType.phone, // Set keyboard type to phone
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly, // Accept only digits
      ],
      decoration: InputDecoration(
        hintText: '00000 00000',
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
        prefixIcon: Icon(Icons.phone),
      ),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
              final phoneNumber = phoneNumberController.text;
  sendPhoneNumber(phoneNumber);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPVerificationPage(phoneNumber: phoneNumber),
                  ),
                );

              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff00926d)), // Change button color to green
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Adjust border radius
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 60)), // Increase button height
              ),
              child: Text(
                'Send Verification Code',
                style: TextStyle(fontSize: 21),
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),
    );
  }
}