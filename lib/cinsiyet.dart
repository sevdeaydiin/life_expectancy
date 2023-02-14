import 'package:flutter/material.dart';

class Cinsiyet extends StatelessWidget {
  final IconData cinsiyetIconu;
  final String cinsiyet;
  final Color renk;

  Cinsiyet(
      {required this.cinsiyet,
      required this.cinsiyetIconu,
      required this.renk});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          cinsiyetIconu, //
          size: 50,
          color: renk,
        ),
        Text(
          cinsiyet, //
          style: TextStyle(
              color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
