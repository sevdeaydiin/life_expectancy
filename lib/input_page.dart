import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/cinsiyet.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import 'myContainer.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = 'KE';
  double yas = 18.0;
  double sporGunu = 3.0;
  int boy = 170;
  int kilo = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: soruStili,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                      onPress: () {}, child: buildRowOutlinedButton('BOY')),
                ),
                Expanded(
                  child: MyContainer(
                      onPress: () {}, child: buildRowOutlinedButton('KİLO')),
                ),
              ],
            ),
          ),
          Expanded(
              child: MyContainer(
            onPress: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Haftada kaç gün spor yapıyorsunuz?',
                  style: soruStili,
                ),
                Text(
                  '${sporGunu.round()}',
                  style: cevapStili,
                ),
                Slider(
                    min: 0,
                    max: 7,
                    value: sporGunu,
                    divisions: 7,
                    onChanged: (double newValue) {
                      setState(() {
                        sporGunu = newValue;
                      });
                    }),
              ],
            ),
          )),
          Expanded(
            child: MyContainer(
              onPress: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Kaç yaşındasınız?', style: soruStili),
                  Text(
                    '${yas.round()}', // ==yas.round().toString()
                    style: cevapStili,
                  ),
                  Slider(
                    min: 0,
                    max: 70,
                    value: yas,
                    onChanged: (double newValue) {
                      setState(() {
                        yas = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightBlue
                        : Colors.white,
                    child: Cinsiyet(
                      cinsiyet: 'KADIN',
                      cinsiyetIconu: FontAwesomeIcons.mars,
                      renk: Colors.pinkAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightBlue
                        : Colors.white,
                    child: Cinsiyet(
                      cinsiyet: 'ERKEK',
                      cinsiyetIconu: FontAwesomeIcons.venus,
                      renk: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                              kilo: kilo,
                              boy: boy,
                              seciliCinsiyet: seciliCinsiyet,
                              sporGunu: sporGunu,
                              yas: yas))));
                },
                child: Text(
                  'Hesapla',
                  style: metinStili,
                )),
          )
        ],
      ),
    );
  }

  Row buildRowOutlinedButton(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: metinStili,
              ),
              Text(
                text == 'BOY' ? boy.toString() : kilo.toString(),
                style: cevapStili,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(side: benimStilim),
                  onPressed: () {
                    setState(() {
                      text == 'BOY' ? boy++ : kilo++;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 20,
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 30,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(side: benimStilim),
                  onPressed: () {
                    setState(() {
                      text == 'BOY' ? boy-- : kilo--;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
