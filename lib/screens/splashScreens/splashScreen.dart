import 'package:flutter/material.dart';
import 'package:apidictionary/screens/home.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadAds();
  }

  loadAds() {
    Future.delayed(
        const Duration(
          seconds: 2
        ),
        () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    double textFontSize = maxWidth * 0.078;
    double spacing = maxHeight * 0.05;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: maxHeight,
          width: maxWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "API Dictionary",
                style: TextStyle(
                  fontSize: textFontSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
              ),
              SizedBox(
                height: spacing,
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
