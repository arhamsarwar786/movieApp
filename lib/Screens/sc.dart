import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

class MoviePlay extends StatefulWidget {

  @override
  _MoviePlayState createState() => _MoviePlayState();
}

class _MoviePlayState extends State<MoviePlay> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white70,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.26,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/trans.jpg"), fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
              
                Container(
                  
                  margin: EdgeInsets.only(
                    top: height * 0.18,
                    left: width * 0.02,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.3,
                        height: height * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/trans.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.495,
                        margin: EdgeInsets.only(
                          top: height * 0.04,
                          left: width * 0.04,
                        ),
                        child: ReadMoreText(
                          "High School Musical: The Musical",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                          trimLength: 26,
                          textAlign: TextAlign.start,
                          trimMode: TrimMode.Length,
                          trimCollapsedText: ".",
                          // trimExpandedText: 'show less',
                          trimLines: 2,
                          moreStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: width * 0.98,
                      margin: EdgeInsets.only(
                          top: 3.h, left: width * 0.01, right: width * 0.01),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment:,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              size: 28,
                              color: Colors.white,
                            ),
                            Text(
                              "Play",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                
                  margin: EdgeInsets.only(top: 2.h),
                  child: ReadMoreText(
                    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                    style: TextStyle(
                        color: Colors.white, fontSize: 10.sp, height: 0.15.h),
                    textAlign: TextAlign.justify,
                    trimLines: 3,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Details',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(top: 5.h,left: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Seasons 1/2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
                listView(width, height),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listView(width, height) {
    List seasonNo = [
      '1 Transformers',
      '2 Transformers',
      '3 Transformers',
      '4 Transformers',
      '5 Transformers'
    ];
   
    List date = [
      'September 25, 2017(canada)',
      'Oct 3,2017',
      'Dec 14, 2017',
      'Dec 14, 2017'
    ];
    ScrollController _scrollController = new ScrollController();

    return Container(
      margin: EdgeInsets.only(top: 0,
         left: 4.w),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: date.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            decoration: BoxDecoration(
              // color: Colors.red,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.white)),
            ),
            margin: EdgeInsets.only(bottom: 1.h, ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.3,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.white),
                        image: DecorationImage(
                          image: AssetImage('assets/trans.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 3.w,
                          ),
                          child: Text(
                            seasonNo[i],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 1.h, left: 3.w),
                          child: Text(
                            date[i],
                            style:
                                TextStyle(fontSize: 9.sp, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.h, left: 3.w),
                          child: Text(
                            "39 minutes",
                            style:
                                TextStyle(fontSize: 9.sp, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 1.h),
                  child: ReadMoreText(
                    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                    style: TextStyle(
                        color: Colors.white, fontSize: 10.sp, height: 0.15.h),
                    textAlign: TextAlign.start,
                    trimLines: 3,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Details',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
