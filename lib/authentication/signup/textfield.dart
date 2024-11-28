import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/auth_controller.dart';
import 'areadyhaveaccount.dart';
import '../login/login_screen.dart';

const double defaultPadding = 16.0;

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  AuthController _controller = Get.put(AuthController());
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _controller.Rusername,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.grey,
            onSaved: (fullName) {},
            decoration: buildInputDecoration("Full Name", Icons.person),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _controller.Remail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.grey,
            onSaved: (emailOrPhone) {},
            decoration: buildInputDecoration("Email or Phone", Icons.email),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _controller.Rpassword,
            textInputAction: TextInputAction.next,
            obscureText: true,
            cursorColor: Colors.grey,
            onSaved: (password) {},
            decoration: buildInputDecoration("Password", Icons.lock),
          ),
          SizedBox(height: 10),
          TextFormField(
            // controller: _signUpController.confirmPasswordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: Colors.grey,
            onSaved: (confirmPassword) {},
            decoration: buildInputDecoration("Confirm Password", Icons.lock),
          ),
          SizedBox(height: 5),
          CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Container(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '  I agree to your',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        ' privacy policy',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        '  and',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    '  term & Conditions',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            value: _isChecked,
            onChanged: (newValue) {
              setState(() {
                _isChecked = newValue ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                String username = _controller.Rusername.text;
                String email = _controller.Remail.text;
                String password = _controller.Rpassword.text;
                _controller.register(username, email, password);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 243, 33, 33),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Sign Up".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheckSignUp(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Icon(icon),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
