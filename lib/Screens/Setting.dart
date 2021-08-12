import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

final translator = GoogleTranslator();

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Text("Setting"),
      //   leading: IconButton(
      //       icon: Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         // fun();
      //         // Navigator.pop(context);
      //       }),
      // ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:15.0,left: 5),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff121210),
                  // color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 26,
                            backgroundImage: AssetImage("assets/irfan hd.png"),
                            backgroundColor: Color(0xff121210),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Irfan Haider",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Apple ID,iCloud,Media & Purchases",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.37,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff121210),
                  child: Column(children: [
                    Column(
                      children: [
                        Container(
                          child: ListTile(
                            leading: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/thi.png")))),
                            title: Text(
                              "FAQ's",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                           
                            trailing: SizedBox(
                              
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Divider(
                              height: 1,
                              color: Colors.white54,
                            ),
                          ),
                        )
                      ],
                    ),
      
                    Column(
                      children: [
                        Container(
                          child: ListTile(
                            leading: Icon(
                              Icons.phone,
                              size: 27,
                              color: Colors.blue,
                            ),
                            title: Text(
                              "Contact Us ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white54,
                              size: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Divider(
                              height: 1,
                              color: Colors.white54,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: ListTile(
                            leading: Icon(
                              Icons.privacy_tip,
                              size: 30,
                              color: Colors.green,
                            ),
                            title: Text(
                              "Privicy Policy ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white54,
                              size: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Divider(
                              height: 1,
                              color: Colors.white54,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: ListTile(
                            leading: Icon(
                              Icons.info_outline,
                              size: 30,
                              color: Colors.blue,
                            ),
                            title: Text(
                              "About Us ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white54,
                              size: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Divider(
                              height: 1,
                              color: Colors.white54,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: ListTile(
                            leading: Icon(
                              Icons.share,
                              size: 30,
                              color: Colors.amber,
                            ),
                            title: Text(
                              "Share Us ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white54,
                              size: 14,
                            ),
                          ),
                        ),
                    
                      ],
                    ),
      
                   
                  ]),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {},
                  child: Card(
                    color: Color(0xff121210),
                    child: ListTile(
                      leading: Icon(
                        Icons.language,
                        size: 30,
                        color: Colors.green,
                      ),
                      title: Text(
                        "Language",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      trailing: FlutterToggleTab(
                        width: 25,
                        borderRadius: 25,
                        height: 28,
                        initialIndex: 0,
                        selectedBackgroundColors: [Color(0xFF0A3157)],
                        unSelectedBackgroundColors: [Color(0xFFB5C1CC)],
                        selectedTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                        unSelectedTextStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        labels: ["En", "Ar"],
                        selectedLabelIndex: (index) {
                          print("Selected Index $index");
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
    // int radioValue = 0;
  }
}

class NewWidget extends StatefulWidget {
  final var1;
  NewWidget(this.var1);

  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  var arh;

  @override
  Widget build(BuildContext context) {
    translator.translate("${widget.var1}", to: 'ar').then((value) {
      setState(() {
        arh = value;
      });
      print(value);
    });

    return Text(
      "$arh",
      style: new TextStyle(fontSize: 16.0, color: Colors.white),
    );
  }
}
