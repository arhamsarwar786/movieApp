import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class Dwonlode extends StatefulWidget {

  @override
  _DwonlodeState createState() => _DwonlodeState();
}
class _DwonlodeState extends State<Dwonlode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          size: 26,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Downlode",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: ListView.builder(
          itemCount: 8,
            itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                // color: Colors.amber,
                height: 21.w,
                width: double.infinity,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.13,
                            
                            width: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/image1.jpeg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.13,
                            width: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only( ),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the printing  ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "by T-Series",
                                        style: TextStyle(
                                            color: Colors.white,
                                        fontSize: 7.sp,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(width: 
                                      10,),
 Text(
                                      "Downlode Complete",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 7.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Text(
                              "220.2 MB",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 6.sp),
                            ),
                             Text(
                              "01:30:38",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 6.sp),
                            ),
                            
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                      // Container(
                      //   height: 80,
                      //   width: 1,
                      //   color: Colors.grey,
                      // ),
                      // Text(
                      //   "DOWNLODE COMPLETE",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w400),
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Text(
                      //   "220.2 MB",
                      //   style: TextStyle(
                      //       color: Colors.white, fontSize: 16),
                      // // ),
                      // // SizedBox(width: 30,),
                      // Container(
                        
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //   color: Color(0xff3DD818),

                      //   ),
                      //   alignment: Alignment.bottomRight,
                      //   child: Icon(Icons.check),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          
          }
             
          ),
        ),
      ),
    );
  }
}
