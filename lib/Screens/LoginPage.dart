import 'package:egybest/Screens/LandingPage(Home).dart';

import 'SignUp.dart';
// import 'package:egy_best/landingPage.dart';
import 'package:flutter/material.dart';
// import 'movieSc.dart';
// import 'seasonSc.dart';
// import 'subhan.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool isHidden = true;
  toggleMethod() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  var emailVal, passVal;
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email or Username is required '),
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required '),
  ]);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
              left: 18.0,
              right: 8.0,
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Image(
                      image: AssetImage("assets/images/egybest.png"),
                      height: 100,
                      width: 250,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 28.0,
                        left: 2,
                      ),
                      child: Container(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    email(),
                    passi(),
                    SizedBox(
                      height: 10.0,
                    ),
                    forget(),
                    SizedBox(
                      height: 20.0,
                    ),
                    button(
                      "LogIn",
                    ),
                    _row("SignUp"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

/***Email */
  Widget email() {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width * 0.05,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        validator: emailValidator,
        onChanged: (val) {
          emailVal = val;
        },
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        controller: emailC,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail_outline,
            color: Color(0x80F0EFEF),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabled: true,
          filled: true,
          isCollapsed: false,
          isDense: false,
          hintText: "Email or Username",
          fillColor: Color(0x33DFCFCF),
          hintStyle: TextStyle(
            color: Color(0x80F0EFEF),
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Widget passi() {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width * 0.05,
      ),
      child: TextFormField(
        validator: passwordValidator,
        onChanged: (val) => passVal = val,
        autovalidate: true,
        obscureText: isHidden,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        controller: pass,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0x80F0EFEF),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                toggleMethod();
              },
              icon: isHidden
                  ? Icon(
                      Icons.visibility,
                      color: Color(
                        0x80F0EFEF,
                      ),
                    )
                  : Icon(Icons.visibility_off,
                      color: Color(
                        0x80F0EFEF,
                      ))),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabled: true,
          filled: true,
          isCollapsed: false,
          isDense: false,

          hintText: "password",
          fillColor: Color(0x33DFCFCF),
          // hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(
            color: Color(0x80F0EFEF),
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Widget button(String txt) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.05,
        bottom: MediaQuery.of(context).size.width * 0.05,
      ),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        color: Colors.amber,
        shape: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(7)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Landing(),
            ),
          );
        },
        child: Text(
          txt,
          style: TextStyle(
            // letterSpacing: 2,
            color: Colors.white,
            // fontWeight: FontWeight.w900,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  Widget _row(String text) {
    return Container(
      // height: MediaQuery.of(context).size.width * 0.05,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              // letterSpacing: 1.5,
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signup(),
                ),
              );
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget forget() {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.03,
      ),
      alignment: Alignment.bottomLeft,
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "forget password?",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
