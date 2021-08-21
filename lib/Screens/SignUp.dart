import 'package:http/http.dart' as http;
import 'package:tmdb_easy/easyTMDB.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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

  bool check = false;

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
   final fnameValidator = MultiValidator([
    RequiredValidator(errorText: 'First Name is required '),
  ]);
  final lnameValidator = MultiValidator([
    RequiredValidator(errorText: 'Last Name is required '),
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required '),
    PatternValidator(r'@', errorText: 'Enter Valid Email Address!')
  ]);
  var passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required '),
  ]);
  final userNameValidator = MultiValidator([
    RequiredValidator(errorText: 'UserName is required '),
  ]);
  final c_PasswordValidator = MultiValidator([
    RequiredValidator(errorText: 'ConfirmPassword is required '),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: check,
        child: SafeArea(
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
                              txtfield('Username', username,
                                  "Enter Your username", u_Name),
                              txtfield('E-Mail', email,
                                  "Enter your valid E-Mail", emailVal),
                              passi(
                                  'Password', pws, passwordValidator, passVal),
                              passi('Confirm Password', c_pwd,
                                  c_PasswordValidator, c_passVall),
                              Center(
                                child: Builder(builder: (context) {
                                  return FlatButton(
                                    color: Colors.amber,
                                    height: 45.0,
                                    minWidth: MediaQuery.of(context).size.width,
                                    onPressed: () async {
                                      FocusScope.of(context).requestFocus(FocusNode());

                                      if (formKey.currentState.validate()) {
                                        setState(() {
                                          check = true;
                                        });
                                        var help = await http.post(
                                          "https://xegybest.com/wp-json/wp/v2/users",
                                          headers: {
                                            'authorization': 'Basic ' +
                                                base64Encode(utf8.encode(
                                                    'admin:admin1122\$\$'))
                                          },
                                          body: {
                                            "username": "${username.text}",
                                            "email": "${email.text}",
                                            "password": "${pws.text}",
                                          },
                                        );

                                        print(help.body);

                                        var data = jsonDecode(help.body);

                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "${data['message']}")));

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                backgroundColor:
                                                    Colors.grey[700],

                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ), //this right here
                                                child: Container(
                                                  height: 150,
                                                  width: 150,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '${data['message'] == null ? 'Account Sucessfully Created' : data['message']}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 320.0,
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            // ignore: deprecated_member_use
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0),
                                                              child:
                                                                  MaterialButton(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(
                                                                        20.0),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  FocusScope.of(context).requestFocus(FocusNode());
                                                                    // if (data['']) {
                                                                      
                                                                    // }
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              LoginPage()));
                                                                },
                                                                // hoverColor: Colors.green,
                                                                color: Colors
                                                                    .amber,
                                                                child: Text(
                                                                  "OK",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14),
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
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text("Fill All Fields")));
                                      }

                                      // print(username.text);
                                      // print(email.text);
                                      // print(pws.text);
                                      // var res =  await http.get("https://xegybest.com/wp-json/wp/v2/users?username=${username.text}&email=${email.text}@gmail.com&password=${pws.text}" ).then((value) => print(value.body));

                                      //  var res = await http.get("https://xegybest.com/wp-login.php?action=register?username=arhamsarwar786&email=arhamsarwar700@gmail.com");
                                      // var res = await http.post("https://xegybest.com/?wpwhpro_action=main_6530&wpwhpro_api_key=tkmik1so6kubty5ijkpgcbxq02assmqgqu6m5irp0hmhx27atvzyaicyjqjr3in4?&action=create_user&user_email=arhamsarwar111@gmail.com");

                                      //  var help =await http.post("https://xegybest.com/wp-json/wp/v2/users",
                                      //  headers: {
                                      //    'authorization': 'Basic ' + base64Encode(utf8.encode('admin:admin1122\$\$'))
                                      //  },
                                      //  body: {
                                      //    "username":"${username.text}",
                                      //   //  "email":"${email.text}",
                                      //    "password":"${pws.text}",
                                      //  },
                                      //  );
                                      // var d = await http.get("https://xegybest.com/wp-json/wp/v2/users?username=allah&email=allah786@gmail.com&password=124");
                                      //  print(help.body);
                                      //  print(d.body);

                                      // var noc = "<?php echo wp_create_nonce( 'wp_rest' ); ?>";
                                      //               var dio  =  Dio();
                                      //              var res = await dio.post("https://xegybest.com/wp-json/wp/v2/users?username=${username.text}&email=${email.text}&password=${pws.text}",
                                      //              options: Options(headers : {
                                      //                 'Content-Type': 'application/json',
                                      // 'Accept':'application/json',
                                      //  'X-WP-Nonce': "$noc"
                                      //              })
                                      //              );

                                      // https://xegybest.com/wp-json/wp/v2/users?username=irfan&email=irfan786@gmail.com&password=1234

                                      // print(res.body);
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
                                  );
                                }),
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
      String pwd, TextEditingController ctrl2, var validee, var valble) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width * 0.05,
      ),
      child: TextFormField(
        validator: passwordValidator,
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
