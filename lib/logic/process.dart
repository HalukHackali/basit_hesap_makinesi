import 'package:flutter/material.dart';

import 'buttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String onceki = "";
  String goruntulenecekDeger = "";
  int islemStatus = 0;
  int birinciSayi = 0;
  String islem = "";
  String sonuc = "";
  String netice = "";
  int sonucDurumu = 0;
  int ikinciSayi = 0;
  String degerBeforePlusMinus = "";
  String sonucBeforePlusMinus = "";
  String sonucAfterPlusMinus = "";

  void btnClick(String btnVal) {
    if (btnVal == "1" ||
        btnVal == "2" ||
        btnVal == "3" ||
        btnVal == "4" ||
        btnVal == "5" ||
        btnVal == "6" ||
        btnVal == "7" ||
        btnVal == "8" ||
        btnVal == "9" ||
        btnVal == "0" ||
        btnVal == "00") {
      setState(() {
        goruntulenecekDeger = goruntulenecekDeger + btnVal;
        if (goruntulenecekDeger.length >= 20){
          goruntulenecekDeger = "❗️ Çok büyük bir sayı girdiniz.";
          //goruntulenecekDeger = goruntulenecekDeger + btnVal;
        }


      });
    }

    if (btnVal == "⌫") {
      if (sonucDurumu == 1) {
      } else {
        setState(() {
          goruntulenecekDeger = "";
          sonuc = "";
        });
      }
    }
    if (btnVal == "AC") {
      birinciSayi = 0;
      ikinciSayi = 0;
      islemStatus = 0;
      sonucDurumu = 0;
      setState(() {
        onceki = "";
        goruntulenecekDeger = "";
        islem = "";
        netice = "";
      });
    }

    if (btnVal == "+") {
      birinciSayi = int.parse(goruntulenecekDeger);
      islem = btnVal;
      setState(() {
        onceki = birinciSayi.toString() + btnVal;
        goruntulenecekDeger = "";
      });
    } else if (btnVal == "−") {
      birinciSayi = int.parse(goruntulenecekDeger);
      islem = btnVal;
      setState(() {
        onceki = birinciSayi.toString() + btnVal;
        goruntulenecekDeger = "";
      });
    } else if (btnVal == "×") {
      birinciSayi = int.parse(goruntulenecekDeger);
      islem = btnVal;
      setState(() {
        onceki = birinciSayi.toString() + btnVal;
        goruntulenecekDeger = "";
      });
    } else if (btnVal == "÷") {
      birinciSayi = int.parse(goruntulenecekDeger);
      islem = btnVal;
      setState(() {
        onceki = birinciSayi.toString() + btnVal;
        goruntulenecekDeger = "";
      });
    }
    if (btnVal == "=") {
      if (islem == "+") {
        setState(() {
          onceki = onceki + goruntulenecekDeger.toString();
          netice = (birinciSayi + int.parse(goruntulenecekDeger)).toString();
          if (onceki.length >= 80){
            onceki = "❗️Sonuç çok büyük !";
            goruntulenecekDeger = "❗️Sonuç çok büyük !";
          }
          goruntulenecekDeger = netice;
        });

      }
      if (islem == "−") {
        setState(() {
          onceki = onceki + goruntulenecekDeger.toString();
          netice = (birinciSayi - int.parse(goruntulenecekDeger)).toString();
          if (onceki.length >= 80){
            onceki = "❗️Sonuç çok büyük !";
            goruntulenecekDeger = "❗️Sonuç çok büyük !";
          }
          goruntulenecekDeger = netice;
        });
      }
      if (islem == "×") {
        setState(() {
          onceki = onceki + goruntulenecekDeger.toString();
          netice = (birinciSayi * int.parse(goruntulenecekDeger)).toString();
          if (onceki.length >= 80){
            onceki = "❗️Sonuç çok büyük !";
            goruntulenecekDeger = "❗️Sonuç çok büyük !";
          }
          goruntulenecekDeger = netice;
        });
      }
      if (islem == "÷") {
        setState(() {
          onceki = onceki + goruntulenecekDeger.toString();
          netice = (birinciSayi / int.parse(goruntulenecekDeger)).toString();
          if (onceki.length >= 80){
            onceki = "❗️Sonuç çok büyük !";
            goruntulenecekDeger = "❗️Sonuç çok büyük !";
          }
          goruntulenecekDeger = netice;
        });
      }
    }
    if (btnVal == "+/-") {
      if (netice == "") {
        if (goruntulenecekDeger != "" &&
            goruntulenecekDeger.substring(0, 1) != "0" &&
            goruntulenecekDeger.substring(0, 1) != "-") {
          degerBeforePlusMinus = goruntulenecekDeger;
          setState(() {
            goruntulenecekDeger = "-" + goruntulenecekDeger;
          });
        } else if (goruntulenecekDeger.substring(0, 1) == "-") {
          setState(() {
            goruntulenecekDeger = degerBeforePlusMinus;
          });
        } else {}
      } else if (goruntulenecekDeger.substring(0, 1) != "-") {
        sonucBeforePlusMinus = netice;
        setState(() {
          goruntulenecekDeger = "-" + goruntulenecekDeger;
        });
      } else if (goruntulenecekDeger.substring(0, 1) == "-") {
        sonucAfterPlusMinus = netice;
        setState(() {
          print(sonucAfterPlusMinus.substring(1));
          goruntulenecekDeger = sonucAfterPlusMinus.substring(1);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: const Alignment(1.0, 1.0),
              padding: EdgeInsets.all(12.0),
              child: Text(
                onceki,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            Container(
              alignment: const Alignment(1.0, 1.0),
              padding: EdgeInsets.all(12.0),
              child: Text(goruntulenecekDeger,
                  style: const TextStyle(fontSize: 44, color: Colors.white)),
            ),
            SizedBox.fromSize(size: const Size.square(8.0)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonCal(
                        sembol: "AC",
                        sembolColor: 0xffABABAB,
                        textSize: 30,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "⌫",
                        sembolColor: 0xffABABAB,
                        textSize: 30,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "+/-",
                        sembolColor: 0xffABABAB,
                        textSize: 37,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "÷",
                        sembolColor: 0xffFFA500,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                    ],
                  ),
                  SizedBox.fromSize(size: const Size.square(8.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonCal(
                        sembol: "7",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "8",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "9",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "×",
                        sembolColor: 0xffFFA500,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                    ],
                  ),
                  SizedBox.fromSize(size: const Size.square(8.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonCal(
                        sembol: "4",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "5",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "6",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "−",
                        sembolColor: 0xffFFA500,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                    ],
                  ),
                  SizedBox.fromSize(size: const Size.square(8.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonCal(
                        sembol: "1",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "2",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "3",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "+",
                        sembolColor: 0xffFFA500,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                    ],
                  ),
                  SizedBox.fromSize(size: const Size.square(8.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonCal(
                        sembol: "0",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "00",
                        sembolColor: 0xff434343,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 80,
                      ),
                      SizedBox.fromSize(size: const Size.square(12.0)),
                      ButtonCal(
                        sembol: "=",
                        sembolColor: 0xffFFA500,
                        textSize: 40,
                        callBack: btnClick,
                        fixedSizeNum: 172,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
