import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:individual_project/controller/auth_controller.dart';
import 'alreadyhaveanAccount.dart';
import '../signup/register_screen.dart';

const double defaultPadding = 16.0; // Define this constant

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');
  }
}

class Textfield extends StatefulWidget {
  const Textfield({Key? key}) : super(key: key);

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  final AuthController _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.grey,
            controller: _controller.Lemail,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          TextFormField(
            controller: _controller.Lpassword,
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: Colors.grey,
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          //forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  textAlign: TextAlign.end,
                  'Forgot password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(179, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          SizedBox(
            width: 450,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                String emailLogin = _controller.Lemail.text;
                String passwordLogin = _controller.Lpassword.text;
                _controller.login(
                  emailLogin,
                  passwordLogin,
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 243, 33, 33),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              child: Text(
                "Login".toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
