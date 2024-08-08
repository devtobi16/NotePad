import 'package:flutter/material.dart';
import 'signuporlogin.dart';
import 'size_config.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(
        Duration(
          seconds: 3,
        ),
        () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Signuporlogin()));
  }

  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      'Tee',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      'Notes',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    // title:dont trust your memory
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
