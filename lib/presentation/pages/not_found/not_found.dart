import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_02epxjye.json",
                width: screenWidth / 3 * 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth / 7),
                child: Text(
                  "404 Not Found",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.indigo,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  context.goNamed('home');
                },
                child: const Column(
                  children: <Widget>[
                    Text('Ir al inicio'),
                    Icon(Icons.home)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}