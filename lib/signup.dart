import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notes_app/login.dart';
import 'accountcreated.dart';
import 'size_config.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController firstname = TextEditingController();

  TextEditingController lastname = TextEditingController();

  TextEditingController confirmpassword = TextEditingController();
  bool creating = false;

  @override
  final _key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Align(
              alignment: Alignment.center,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your First Name';
                        }
                      },
                      controller: firstname,
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
                          hintText: 'First Name',
                          focusColor: Colors.purple,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.purple,
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'Last Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Last Name';
                        }
                      },
                      controller: lastname,
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
                          hintText: 'Last Name',
                          focusColor: Colors.purple,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.purple,
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'E-mail',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your E-mail Address';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                      },
                      controller: email,
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
                          hintText: 'E-mail Address',
                          focusColor: Colors.purple,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.purple,
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Create Your Password';
                        }
                      },
                      controller: password,
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
                          hintText: 'Create Password',
                          focusColor: Colors.purple,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.purple,
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty && password != confirmpassword) {
                          return 'Enter Your Password';
                        }
                      },
                      controller: confirmpassword,
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
                          hintText: 'Re-enter Password',
                          focusColor: Colors.purple,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.purple,
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Row(
                      children: [
                        Text(
                          'Already have an account ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()));
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          creating = true;
                        });
                        if (_key.currentState!.validate())
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text.trim(),
                            password: password.text,
                          );
                        Future.delayed(Duration(seconds: 5)).then((value) {
                          print('Created Account Successfully');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => accountcreated()));
                        }).onError((error, stackTrace) {
                          print('Error${error.toString()}');
                        });
                      },
                      child: Container(
                        height: getProportionateScreenHeight(54),
                        width: getProportionateScreenWidth(335),
                        child: Center(
                          child: creating
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign Up',
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
