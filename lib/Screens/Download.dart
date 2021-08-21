// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:sizer/sizer.dart';
// import 'package:hive/hive.dart';

// class DownloadPage extends StatefulWidget {
//     final allMoviesData, link;

//   DownloadPage([this.allMoviesData, this.link]);

//   @override
//   _DownloadPageState createState() => _DownloadPageState();
// }
// class _DownloadPageState extends State<DownloadPage> {

// var downloadKey ,downloadVal;


//   @override
//   void initState() {   
//     super.initState();

//       downloadKey = Hive.box(
//                                                             "downloadKey");
//                                                         downloadVal = Hive.box(
//                                                             "downloadVal");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: Color(0x67414040),
//         appBar: AppBar(
//           elevation: 0,
//           centerTitle: true,
//           leading: IconButton(  
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.amber,
//             ),
//           ),
//           backgroundColor: Colors.black,
//           title: Text(
//             "DOWNLOAD",
//             style: TextStyle(color: Colors.amber, fontSize: 22),
//           ),
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.black,
          
          
//           child: ListView.builder(
//             shrinkWrap: true,
//           itemCount: downloadKey.length,
//             itemBuilder: (context,index){
//                       var data = downloadVal.get("${downloadKey.getAt(index)}");

//             return Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 decoration : BoxDecoration(
//                     boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey[200],
//                       offset: const Offset(
//                         2.0,
//                         2.0,
//                       ),
//                       blurRadius: 3.0,
//                       spreadRadius: 2.0,
//                     ), //BoxShadow
//                     BoxShadow(
//                       color: Colors.black,
//                       offset: const Offset(0.0, 0.0),
//                       blurRadius: 0.0,
//                       spreadRadius: 0.0,
//                     ), //BoxShadow
//                   ],
//                 ),
                
//                 // color: Colors.amber,
                
//                 width: double.infinity,
//                 child: Card(
                  
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   color: Colors.black54,
//                   // color: Colors.red,
//                   child: Column(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: MediaQuery.of(context).size.height*0.13,
                            
//                             width: 80,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: NetworkImage("${data['image']}"),
//                                   fit: BoxFit.fill),
//                             ),
//                           ),
//                           Container(
                            
//                             height: MediaQuery.of(context).size.height*0.13,
//                             width: 2,
//                             color: Colors.grey,
//                             // color: Colors.red,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only( ),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.70,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "${data['title']}",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 8.sp,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         "${data['tagline']}",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                         fontSize: 7.sp,
//                                             fontStyle: FontStyle.italic,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       SizedBox(width: 
//                                       10,),
//                              Text(
//                                       "Downlode Complete",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 7.sp,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 5,),
//                                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                        Text(
//                               "220.2 MB",
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 6.sp),
//                             ),
//                              Text(
//                               "01:30:38",
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 6.sp),
//                             ),
                            
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: 1,
//                         width: double.infinity,
//                         color: Colors.grey,
//                       ),
                      
//                     ],
//                   ),
//                 ),
//               ),
//             );
          
//           }
             
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:hive/hive.dart';



class DownloadPage extends StatefulWidget {
   final allMoviesData, link;

  DownloadPage([this.allMoviesData, this.link]);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}
class _DownloadPageState extends State<DownloadPage> {

  
var downloadKey ,downloadVal;


  @override
  void initState() {   
    super.initState();

      downloadKey = Hive.box(
                                                            "downloadKey");
                                                        downloadVal = Hive.box(
                                                            "downloadVal");

                                                            setState(() {
                                                              
                                                            });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

        downloadVal.clear();
        downloadKey.clear();
        
        // print(downloadVal.get("$downloadKey.getAt(0)}"));
        setState(() {
          
        });
      },),
      backgroundColor: Color(0x67414040),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(  
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.amber,
            ),
          ),
          backgroundColor: Colors.black,
          title: Text(
            "DOWNLOAD",
            style: TextStyle(color: Colors.amber, fontSize: 22),
          ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: downloadKey.length == null ? Center(child: Text("No Downloaded Video Yet" ,style: TextStyle(color: Colors.white),),) :   ListView.builder(
            shrinkWrap: true,
          itemCount: downloadKey.length  == null ? 0 : downloadKey.length,
            itemBuilder: (context,index){
                      var data = downloadVal.get("${downloadKey.getAt(index)}");

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                // color: Colors.amber,
                
                width: double.infinity,
                child: Card(
                  
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.black54,
                  // color: Colors.red,
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
                                  image: NetworkImage("${data['image']}"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            
                            height: MediaQuery.of(context).size.height*0.13,
                            width: 2,
                            color: Colors.grey,
                            // color: Colors.red,
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
                                    "${data['title']}",
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
                                        "${data['tagline']}",
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
                                  ),
                                 Container(margin: EdgeInsets.only(top: 20),
                                   width: MediaQuery.of(context).size.width*0.5,
                                   child: LinearProgressIndicator(
                                     
                              value: 100,
                              backgroundColor: Colors.amber,
                              color: Colors.white,
                            ),
                                 ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                              "100%",
                              style: TextStyle(
                                    color: Colors.white, fontSize: 8.sp),
                            ),
                                  ),
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