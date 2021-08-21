import 'package:egybest/Screens/variable.dart';
import 'package:flutter/material.dart';
// import 'package:lms2/API/globle.dart';
import 'package:translator/translator.dart';
import 'package:hive/hive.dart';

import 'LandingPage(Home).dart';

var tran = GoogleTranslator();

class Translate extends StatefulWidget {
  final name, fontSize, fontWeight, color;
  Translate(this.name, [this.fontSize, this.color, this.fontWeight]);

//  Translate.myCon(){
//    print("CALLED");
//    initFun();
//   }

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  var val, sLang;

  @override
  initState() {
    super.initState();
    // initFun();
  }

    // var lang = await Hive.openBox("lang");
    //   sLang = lang.get('sLang');
    //   print("this is In Translate $sLang");


  initFun() async {
    tran
        .translate(
      widget.name,
      to: lang,
    )
        .then((value) {
      setState(() {
        val = value.toString();
      });
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${val == null ? '' : val}",
      style: TextStyle(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.color,
      ),
    );
  }
}






// class Trans extends StatefulWidget {

//   @override
//   _TransState createState() => _TransState();
// }

// class _TransState extends State<Trans> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//         NewWidget("Hello"),
//         NewWidget("Ubaid"),
//         NewWidget("Arham"),
//       ],),
//     );
//   }
// }
