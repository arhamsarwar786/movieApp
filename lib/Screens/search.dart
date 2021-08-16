// import 'package:easy_localization/easy_localization.dart';
import 'dart:convert';

import 'package:egybest/Screens/SHOW.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:http/http.dart' as http;

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  var data, moviesDataWp, downloadLink;

  var searchList = [];

  @override
  void initState() {
    super.initState();
    getAllDataWP();
  }

  getAllDataWP() async {
    // print("Enter into WP Function");
    data = await http.get("https://xegybest.com/wp-json/wp/v2/movie");

    // var download =
    //     await http.get("https://xegybest.com/wp-json/wp/v2/dt_links");
    // var downloadLinkAll = jsonDecode(download.body);

    // print(data.statusCode);
    moviesDataWp = jsonDecode(data.body);

    for (var i = 0; i < moviesDataWp.length; i++) {
      searchList.add(moviesDataWp[i]['original_title']);
    }

    print(searchList);

    setState(() {});
  }

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  String dataInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        //  elevation: 0,
        backgroundColor: Colors.black87,
        elevation: 8,
        leading: IconButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 21,
            color: Colors.white,
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.only(right: 4, top: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
                width: MediaQuery.of(context).size.width * 0.70,
                height: MediaQuery.of(context).size.width * 0.11),
            child: AutoCompleteTextField(
              //  cursorColor: Colors.amber,

              itemSubmitted: (item) {
                print(item);
              },

              key: key,
              suggestions: searchList,
              itemBuilder: (context, suggestion) => suggestion == dataInput
                  ? Padding(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            color: Colors.black),
                        child: ListTile(
                          title: Text("No Item Found"),
                        ),
                      ),
                      padding: EdgeInsets.all(8.0),
                    )
                  : InkWell(
                    onTap: (){
                      var val;
                      for (var i = 0; i < moviesDataWp.length; i++) {
                        if ( moviesDataWp[i]['original_title']  == suggestion) {
                            setState(() {
                            val = moviesDataWp[i];
                                                          
                                                        });
                        }
                        
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SHOW(val),),);
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.amber)),
                        child: ListTile(
                          title: Text(
                            suggestion,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                  ),
              itemSorter: (a, b) => a.compareTo(b),
              itemFilter: (suggestion, input) {
                dataInput = input;
                return suggestion.toLowerCase().startsWith(input.toLowerCase());
              },

              style: TextStyle(color: Colors.white, fontSize: 13, height: 1.5),
              //  cursorColor: Colors.black,

              // textAlign: TextAlign.start,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white70,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: EdgeInsets.only(top: 20, left: 20),
                fillColor: Colors.white12,
                filled: true,
                hintText: "Search Movies",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(),

        // child: ListView.builder(
        // itemCount: 8,
        //   itemBuilder: (context,index){
        //   return Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child:Container(
        //         // color: Colors.amber,
        //         height: 55,
        //         width: double.infinity,
        //         child: Card(
        //           elevation: 0,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(8)),
        //           color: Colors.black54,
        //           child: Column(
        //             children: [
        //               Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Container(
        //                     height: 45,

        //                     width: 50,
        //                     decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                           image: AssetImage("assets/image1.jpeg"),
        //                           fit: BoxFit.fill),
        //                     ),
        //                   ),

        //                   SizedBox(
        //                     width: 10,
        //                   ),
        //                   Flexible(
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           "Lorem Ipsum is simply dummy text of the printing  ",
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 14,
        //                               fontWeight: FontWeight.w700),
        //                         ),

        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),

        //             ],
        //           ),
        //         ),
        //       ),
        //     );

        //   }

        //   ),
      ),
    );
  }
}
