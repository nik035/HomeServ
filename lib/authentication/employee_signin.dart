import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:http/http.dart';
import 'package:manpower_management_app/authentication/employee_signup.dart';
import 'package:manpower_management_app/authentication/regstier.dart';
import 'package:manpower_management_app/screens/home_screen.dart';
import 'package:manpower_management_app/screens/worker_home.dart';
import 'package:manpower_management_app/screens/worker_verification.dart';
import 'package:manpower_management_app/services/forgot_password.dart';

class EmployeeLogin extends StatefulWidget {
  const EmployeeLogin({Key? key}) : super(key: key);

  @override
  _EmployeeLoginState createState() => _EmployeeLoginState();
}

class _EmployeeLoginState extends State<EmployeeLogin> {
  bool isObscure = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffC08BF2), Color(0xffF2A575)])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => HomeScreen()
                ));
              },
            )
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 50),
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                prefixIcon: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.email)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: isObscure,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
                                    },
                                    icon: Icon(
                                        isObscure ?
                                        Icons.visibility_off : Icons.visibility
                                    )
                                ),
                                prefixIcon: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.lock)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 340,
                                child: ElevatedButton(
                                  child: Text(
                                    'Login',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffCDF3FB),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      textStyle: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal)),
                                  onPressed: () {
                                    rlogin();
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder:
                                      (context) => EmployeeRegister()
                                  ));
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blueGrey,
                                      fontSize: 20),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder:
                                        (context) => ForgotPassword()
                                    ));
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blueGrey,
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                            height: 30,
                            child: Center(
                              child: Text(
                                'or',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                            child: SignInButton(
                              Buttons.Google,
                              mini: false,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> rlogin() async {
    if(passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      Response response = await post(
          Uri.parse('https://reqres.in/api/login'),
          body: {
            'email' : 'eve.holt@reqres.in',
            'password' : 'city'
          });
      if(response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ServicePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank Field Not Allowed.")));
    }
  }
}

