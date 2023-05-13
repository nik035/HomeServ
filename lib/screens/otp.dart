import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manpower_management_app/screens/payment.dart';

class ConfirmWorkPage extends StatefulWidget {
  final String work;
  final String address;
  final String phone;

  const ConfirmWorkPage(
      {Key? key,
        required this.work,
        required this.address,
        required this.phone})
      : super(key: key);

  @override
  _ConfirmWorkPageState createState() => _ConfirmWorkPageState();
}

class _ConfirmWorkPageState extends State<ConfirmWorkPage> {
  late String _otp;
  bool _showOtpTextField = false;
  String _otpGenerated='';

  @override
  void initState() {
    super.initState();
    _otp = '';
  }

  void _generateOtp() {
    final random = Random();
    const int min = 1000;
    const int max = 9999;
    final int generatedOtp = min + random.nextInt(max - min);
    // setState(() {
    //   _otp = generatedOtp.toString();
    // });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('OTP Generated'),
          content: Text('Your OTP is: $generatedOtp'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  _showOtpTextField = true;
                  _otp = generatedOtp.toString();
                  _otpGenerated=generatedOtp.toString();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Work"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text("Work: ${widget.work}", style: TextStyle(fontSize: 24)),
          SizedBox(height: 8),
          Text("Address: ${widget.address}", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text("Phone: ${widget.phone}", style: TextStyle(fontSize: 16)),
          SizedBox(height: 32),
          Center(
            child: Column(
              children: [
                Text("Please enter the OTP below to confirm the work."),
                SizedBox(height: 16),
                if (_otp.isEmpty)
                  ElevatedButton(
                    onPressed: _generateOtp,
                    child: Text("Get OTP"),
                  ),
                if (_showOtpTextField) ...[
                  SizedBox(height: 20.0),
                  Text('OTP: $_otp'),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter OTP",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _otp = value;
                      });
                    },
                  ),
                ],
                SizedBox(height: 16),
                Visibility(
                  visible: _showOtpTextField,
                  child: ElevatedButton(
                    onPressed: _otp == _otpGenerated
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    }
                        : null,
                    child: Text("Proceed"),
                  ),
                ),
                if (_otp != _otpGenerated && _otp.isNotEmpty)
                  Text("Wrong OTP entered. Please try again."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
