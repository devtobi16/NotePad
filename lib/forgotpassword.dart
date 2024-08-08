import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/login.dart';
import 'size_config.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  TextEditingController email = TextEditingController();
  @override
  final _key =GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Align(
              alignment: Alignment.center,
              child: Form(key: _key,
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Email Address';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'E-mail Address',
                          focusColor: Colors.purple,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.purple,
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(_key.currentState!.validate())
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(
                              email: email.text.trim(),
                            )
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login())));
                      },
                      child: Container(
                        height: getProportionateScreenHeight(54),
                        width: getProportionateScreenWidth(335),
                        child: Center(
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
