import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/NavBar.dart';
import 'package:e_commerce/Data_Provider/remote/FireBase.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final FormKey = GlobalKey<FormState>();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();
  void onButtonPressed() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xffB81736),
            Color(0xff281537),
          ])),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              " SIGN UP",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Form(
                key: FormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: UsernameController,
                        decoration: InputDecoration(
                          label: Text(
                            "Username",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: Color(0xffB81736),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Username";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: EmailController,
                        decoration: InputDecoration(
                          label: Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          ),
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: Color(0xffB81736),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Email";
                          }
                          if (!value.contains("@")) {
                            return "Please Enter  A Valid Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: PasswordController,
                        decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB81736),
                            ),
                          ),
                          prefixIcon: const Icon(Icons.password),
                          prefixIconColor: Color(0xffB81736),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password";
                          }
                          if (value.length < 8) {
                            return "Password Must Be At Least 8 Charachters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 55,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            signUp(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffB81736),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 130,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  void signUp(context) async {
    if (FormKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      FireBase()
          .SignUp(
              EmailController.text.toString(),
              PasswordController.text.toString(),
              UsernameController.text.toString())
          .then((value) {
        if (value is User) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => NavBar()));
        } else if (value is String) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value)));
        }
      });
    }
  }
}
