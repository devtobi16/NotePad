import 'package:flutter/material.dart';
import 'package:notes_app/signup.dart';
import 'login.dart';
import 'size_config.dart';

class Signuporlogin extends StatelessWidget {
  const Signuporlogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Container(
                    height: getProportionateScreenHeight(54),
                    width: getProportionateScreenWidth(335),
                    child: Center(
                      child: Text(
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
                SizedBox(
                  height: getProportionateScreenHeight(10)
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Container(
                    height: getProportionateScreenHeight(54),
                    width: getProportionateScreenWidth(335),
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.purple,)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
