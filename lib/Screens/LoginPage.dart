import 'dart:convert';

import 'package:egybest/Screens/LandingPage(Home).dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:hive/hive.dart';
import 'SignUp.dart';
// import 'package:sizer/sizer.dart';
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
  bool check = false;
  var userDetail;

 

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.amber,
      inAsyncCall: check,
      child: SafeArea(
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
                      // forget(),
                      // SizedBox(
                      //   height: 20.0,
                      // ),
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
      child: Builder(builder: (context) {
        return MaterialButton(
          color: Colors.amber,
          shape: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(7)),
          onPressed: () async {

            FocusScope.of(context).requestFocus(FocusNode());

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Landing(),
            //   ),
            // );

            if (formKey.currentState.validate()) {
              setState(() {
                check = true;
              });

              var res = await http.post(
                  "https://xegybest.com/wp-json/jwt-auth/v1/token",
                  headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                  },
                  body: jsonEncode({
                    "username": "${emailC.text}",
                    //  "email":"${email.text}",
                    "password": "${pass.text}",
                  }));

              var data = jsonDecode(res.body);
              print(data);

              if (data['success'] == false || data['statusCode'] != 200) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.grey[700],

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ), //this right here
                        child: Container(
                          height: 200,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${data['message']}',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 320.0,
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // ignore: deprecated_member_use
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             LoginPage()));
                                          Navigator.pop(context);
                                        },
                                        // hoverColor: Colors.green,
                                        color: Colors.amber,
                                        child: Text(
                                          "Try Again",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        minWidth: 60.0,
                                        height: 35,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });

                setState(() {
                  check = false;
                });
              } else {

                  if(data['success'] == true || data['statusCode'] == 200){

                    var box = Hive.box("userDetail");
                    var userKey = Hive.box("userKey");

                    box.put("${emailC.text}",{
                      "id" : data['id'],
                      "firstName" : data['firstName'],
                      "lastName" : data['lastName'],
                      "username" : data['nicename'],
                      "email" : data['email'],
                      "token" : data['data']['token'],
                    });
                    userKey.add("${emailC.text}");

                    print(box.getAt(0));

                Scaffold.of(context)
                    // ignore: deprecated_member_use
                    .showSnackBar(SnackBar(content: Text("SuccessFully Logged in")));

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Landing()),);
                    setState(() {
                                          check = false;
                                        });
                  }
                                        
              }
            }else{
               Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Fill All Fields")));
            }
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
        );
      }),
    );
  }

  Widget _row(String text) {
    return Container(
      // height: MediaQuery.of(context).size.width * 0.05,
      width: MediaQuery.of(context).size.width*0.94,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.001,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 16,
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
                fontSize: 16,
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
