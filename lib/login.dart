import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notes_app/home.dart';
import 'signup.dart';
import 'forgotpassword.dart';
import 'size_config.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = false;
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  final _key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Align(
              alignment: Alignment.center,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    // Use poppins style here with google
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      'Welcome Back !',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
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
                      height: getProportionateScreenHeight(10),
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
                      height: getProportionateScreenHeight(20),
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
                      height: getProportionateScreenHeight(10),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Password';
                        }
                      },
                      obscureText: visible,
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
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          focusColor: Colors.purple,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.purple,
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => forgotpassword()));
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text.trim(),
                                  password: password.text);

                          Future.delayed(Duration(seconds: 5)).then((value) {});
                          setState(() {
                            loading = false;
                          });
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      },
                      child: Container(
                        height: getProportionateScreenHeight(54),
                        width: getProportionateScreenWidth(335),
                        child: Center(
                          child: loading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Log In',
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
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Row(
                        children: [
                          Text(
                            'Don\'t have an account ?',
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
                                      builder: (context) => Signup()));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.purple,
                              ),
                            ),
                          )
                        ],
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
