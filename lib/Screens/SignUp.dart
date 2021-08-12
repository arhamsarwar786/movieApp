import 'package:http/http.dart' as http;
import 'package:tmdb_easy/easyTMDB.dart';
import 'LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:dio/dio.dart';


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var imageFile;
  final picker = ImagePicker();

  choseImage(ImageSource source) async {
    // final pickedFile = await picker.getImage(source: source);

    setState(() {
      // imageFile = File(pickedFile.path);
    });
  }

  var formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pws = TextEditingController();
  TextEditingController c_pwd = TextEditingController();
  bool isHidden = true;
  toggleMethod() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  var emailVal, passVal, c_passVall, u_Name;
  // final emailValidator = MultiValidator([
  //   RequiredValidator(errorText: 'Email is required '),
  //   PatternValidator(r'@', errorText: 'Enter Valid Email Address!')
  // ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required '),
  ]);
  // final userNameValidator = MultiValidator([
  //   RequiredValidator(errorText: 'UserName is required '),
  // ]);
  final c_PasswordValidator = MultiValidator([
    RequiredValidator(errorText: 'ConfirmPassword is required '),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white70,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 20,
                          right: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Sign-Up",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Center(
                              child: Container(
                                child: imageFile != null
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundImage: FileImage(imageFile),
                                      )
                                    : CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Color(0x67E6DEDE),
                                        child: IconButton(
                                            onPressed: () {
                                              choseImage(ImageSource.gallery);
                                            },
                                            icon: Icon(
                                              Icons.add_a_photo,
                                              color: Colors.amber,
                                            )),
                                      ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            txtfield('Username', username, "Enter Your username",
                                u_Name),
                            txtfield('E-Mail', email, "Enter your valid E-Mail",
                                emailVal),
                            passi('Password', pws, passwordValidator, passVal),
                            passi('Confirm Password', c_pwd,
                                c_PasswordValidator, c_passVall),
                            Center(
                              child: FlatButton(
                                color: Colors.amber,
                                height: 45.0,
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () async{


                                  var noc = "<?php echo wp_create_nonce( 'wp_rest' ); ?>";
                    //               var dio  =  Dio();
                    //              var res = await dio.post("https://xegybest.com/wp-json/wp/v2/users?username=${username.text}&email=${email.text}&password=${pws.text}",
                    //              options: Options(headers : {
                    //                 'Content-Type': 'application/json',
                    // 'Accept':'application/json',
                    //  'X-WP-Nonce': "$noc"
                    //              })
                    //              );
                                  
                                  
                                // https://xegybest.com/wp-json/wp/v2/users?username=irfan&email=irfan786@gmail.com&password=1234

                                var res =  await http.get("https://xegybest.com/wp-json/wp/v2/users?username=irfann&email=irfan786@gmail.com&password=1234" , 

                                // var res =  await http.post("https://xegybest.com/wp-json/jwt-auth/v1/token" , 
                  //                headers: {
                  //   'Content-Type': 'application/json',
                  //   'Accept':'application/json',                    
                  // },

                  // body: jsonEncode({
                  //   "username" : "arhamsarwar",
                  //   "email": "arhamsarwar786@gmail.com",
                  //   "password": "1234"
                  // })
                                );
                                  print(res.body);
                                },
                                // style: ElevatedButton.styleFrom(
                                //   primary: Colors.amber,
                                //   shadowColor: Colors.black,
                                // ),
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Already have an Account?",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Log In',
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget txtfield(
      String txt, TextEditingController ctrl, String errText, var val) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width * 0.05,
      ),
      child: TextFormField(
        validator: MultiValidator([
          RequiredValidator(errorText: errText),
        ]),
        onChanged: (val) {
          var valid;
          valid = val;
        },
        // textDirection: TextDirection.rtl,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white, fontSize: 22),
        controller: ctrl,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabled: true,
          filled: true,
          isCollapsed: false,
          isDense: false,
          // prefixIcon: Icon(
          //   Icons.mail,
          //   color: Colors.white,
          // ),
          hintText: txt,
          fillColor: Color(0x67E6DEDE),
          // hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(
            color: Color(0xC5F0EFEF),
            // fontWeight: FontWeight.w900,
            fontSize: 22.0,
            // color: Colors.black,
          ),
          // border: OutlineInputBorder(
          //   borderSide:
          //       BorderSide(color: Colors.black, style: BorderStyle.solid),
          //   borderRadius: BorderRadius.circular(7),
          // )
        ),
      ),
    );
  }

  Widget passi(
      String pwd, TextEditingController ctrl2, final validee, var valble) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width * 0.05,
      ),
      child: TextFormField(
        // validator: validee,
        onChanged: (valble) {
          // var validee;
          // validee = valble;
        },
        obscureText: isHidden,
        // textDirection: TextDirection.rtl,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white, fontSize: 22),
        controller: ctrl2,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                toggleMethod();
              },
              icon: isHidden
                  ? Icon(
                      Icons.visibility,
                      color: Color(0x80F0EFEF),
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: Color(0x80F0EFEF),
                    )),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabled: true,
          filled: true,
          isCollapsed: false,
          isDense: false,
          // prefixIcon: Icon(
          //   Icons.mail,
          //   color: Colors.white,
          // ),
          hintText: pwd,
          fillColor: Color(0x67E6DEDE),
          // hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(
            color: Color(0xC5F0EFEF),
            // fontWeight: FontWeight.w900,
            fontSize: 22.0,
            // color: Colors.black,
          ),
          // border: OutlineInputBorder(
          //   borderSide:
          //       BorderSide(color: Colors.black, style: BorderStyle.solid),
          //   borderRadius: BorderRadius.circular(7),
          // )
        ),
      ),
    );
  }
}
