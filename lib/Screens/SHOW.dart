import 'package:egybest/Screens/Download.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:egybest/Screens/downloadScreen.dart';
import 'package:egybest/Screens/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:tmdb_easy/easyTMDB.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:hive/hive.dart';
import 'download_provider.dart';
import 'webView.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

// import 'videoPlay.dart';

class SHOW extends StatefulWidget {
  final allMoviesData;
  SHOW(this.allMoviesData);

  @override
  _SHOWState createState() => _SHOWState();
}

class _SHOWState extends State<SHOW> {


  

  var favKey;
  var favVal;
  List myList = [];

  var downloadKey, downloadVal;
  @override
  void initState() {
    super.initState();

    favKey = Hive.box("favKey");
    favVal = Hive.box("favVal");

    downloadKey = Hive.box("downloadKey");
    downloadVal = Hive.box("downloadVal");

    downloadVideo();

    setState(() {});
    // popularMovies();
  }

  List downloadLink = [];
  downloadVideo() async {
    var download =
        await http.get("https://xegybest.com/wp-json/wp/v2/dt_links");
    var downloadLinkAll = jsonDecode(download.body);

    // for (var i = 0; i < moviesDataWp.length; i++) {

    print((widget.allMoviesData['title']['rendered'] ==
        downloadLinkAll[0]['title']['rendered']));

    for (var j = 0; j < downloadLinkAll.length; j++) {
      if (widget.allMoviesData['title']['rendered'] ==
          downloadLinkAll[j]['title']['rendered']) {
        downloadLink.add({
          "title": "${downloadLinkAll[j]['title']['rendered']}",
          "_dool_url": "${downloadLinkAll[j]['_dool_url']}",
          "_dool_lang": "${downloadLinkAll[j]['_dool_lang']}",
          "_dool_type": "${downloadLinkAll[j]['_dool_type']}",
          "_dool_quality": "${downloadLinkAll[j]['_dool_quality']}",
          "dt_views_count": "${downloadLinkAll[j]['dt_views_count']}"
        });
      }
    }
    setState(() {});
    print(downloadLink);
  }
  // }
  // var tmdb = EasyTMDB("05902896074695709d7763505bb88b4d");

  // var popular;

  // // Popular Movies
  // popularMovies() async {
  //   tmdb.movie().popular().then((value) {
  //     // print("Enter");
  //     popular = value.toJson();
  //     var posterImages, backdropImages;
  //     for (int i = 0; i < popular['results'].length; i++) {
  //       var poster = popular['results'][i]["poster_path"];
  //       var backdrop = popular['results'][i]["backdrop_path"];
  //       posterImages = poster.toString().replaceAll("http", "https");
  //       backdropImages = backdrop.toString().replaceAll("http", "https");
  //       popular['results'][i]["poster_path"] = posterImages;
  //       popular['results'][i]["backdrop_path"] = backdropImages;
  //     }
  //     setState(() {});
  //   });
  //   // print(popular);
  // }

  //  var fileDownloaderProvider;

  @override
  Widget build(BuildContext context) {
      
    print(widget.allMoviesData);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          // var fileManger = FileDownloaderProvider();

          // print(fileDownloaderProvider.downloadPercentage);
          // print("this is  %%%%%%%%%%%%%%%%%%%%%%%%%  ${fileManger.downloadPercentage}");
          // print(link);

          // print("${downloadVal.get(link['title'])}");
          // downloadVal.put(
          //     "${link['title']}", {'title': "${link['title']}", 'file': "Arham"});
          // print("${downloadVal.get(link['title'])}");
        },
      ),
      backgroundColor: Color(0xff181818),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                containerImg(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.68,
                      child: text(
                          height * 0.02,
                          width * 0.05,
                          "${widget.allMoviesData['original_title']}",
                          18.0,
                          Colors.white),
                    ),
                  ],
                ),
                text(height * 0.01, width * 0.05, "Adventure, Drama, Family",
                    13.0, Colors.white),
                rating(height, width),
                detailText(height, width),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: width * 0.05, top: 10),
                        child: Text(
                          "Release Date : ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    text(
                        height * 0.01,
                        width * 0.05,
                        "${widget.allMoviesData['release_date']}",
                        13.0,
                        Colors.white),
                  ],
                ),
                // listview(height, width,widget.allMoviesData['dt_cast']),
              ],
            ),
            Positioned(
              top: height * 0.05,
              left: width * 0.05,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.amber,
                  size: 30,
                ),
              ),
            ),
            containerStack(height, width),
            playButton(
                height, width, widget.allMoviesData['repeatable_fields']),
          ],
        ),
      ),
    );
  }

  Widget containerImg() {
    return ClipPath(
// clipper: DiagonalPathClipperOne(),
      clipper: CustomClipPath(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.44,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://image.tmdb.org/t/p/original${widget.allMoviesData['dt_backdrop']}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget containerStack(height, width) {
    return Positioned(
      top: height * 0.14,
      left: width * 0.05,
      child: Container(
        width: width * 0.35,
        height: height * 0.28,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://image.tmdb.org/t/p/original${widget.allMoviesData['dt_poster']}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget playButton(height, width, response) {
    return Positioned(
      top: height * 0.34,
      left: width * 0.68,
      child: MaterialButton(
        height: 60,
        onPressed: () {
          // Dialog2() {
          return showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.topCenter,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(top: 2),
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                            child: response == ""
                                ? Center(
                                    child: Text("No Server Selected Yet"),
                                  )
                                : ListView.builder(
                                    itemCount: response.length,
                                    // itemExtent: 4,
                                    itemBuilder: (BuildContext context, index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => Web(
                                                          response[index]
                                                              ['url'])));
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: width * 0.90,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                    border: Border.all(
                                                        color: Colors.red)),
                                                child: Text(
                                                  "${response[index]['name']}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      );
                                    }),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: -60,
                      //   child: CircleAvatar(
                      //     backgroundColor: Colors.redAccent,
                      //     radius: 60,
                      //     child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                      //   )
                      // ),
                      Positioned(
                        top: -60,
                        child: MaterialButton(
                          elevation: 8,
                          height: 12,
                          onPressed: () {},
                          color: Colors.white,
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 100,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Positioned(
                          left: MediaQuery.of(context).size.width * 0.6,
                          top: 2,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 25,
                              )))
                    ],
                  ));
            },
          );
          // }

          // final snackBar = SnackBar(
          //   // duration: const Duration(se),
          //   content: Container(
          //     height: 200,
          //     child: response == ""
          //         ? Center(
          //             child: Text(
          //             "No Server Added Yet",
          //             style: TextStyle(color: Colors.white),
          //           ))
          //         : ListView.builder(
          //             itemCount: response.length,
          //             // itemExtent: 4,
          //             itemBuilder: (BuildContext context, index) {
          //               return Column(
          //                 children: [
          //                   FlatButton(
          //                     minWidth: MediaQuery.of(context).size.width,
          //                     onPressed: () {
          //                       // widget.downloadLink[index]['']
          //                       // var link = widget.downloadLink[index];
          //                       Navigator.push(
          //                           context,
          //                           MaterialPageRoute(
          //                               builder: (context) =>
          //                                   Web(response[index]['url'])));
          //                     },
          //                     child: Text(
          //                       "${response[index]['name']}",
          //                       style: TextStyle(
          //                         color: Colors.amber,
          //                       ),
          //                     ),
          //                   ),
          //                   Divider(
          //                     thickness: 2,
          //                     color: Color(0xD53B3A3A),
          //                   ),
          //                 ],
          //               );
          //             }),
          //   ),
          // );

//  onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Favourite()));
//               },
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);

          // onPressed: () {

          // },
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => Web(response[0]['url']),
          //     ));
        },
        color: Colors.white,
        shape: CircleBorder(),
        child: Icon(
          Icons.play_circle_fill,
          size: 60,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget text(height, width, text, fontsize, textColor) {
    return Container(
      margin: EdgeInsets.only(top: height, left: width),
      child: Text(
        text,
        style: TextStyle(fontSize: fontsize, color: textColor),
      ),
    );
  }

  Widget rating(height, width) {
    return Container(
      margin: EdgeInsets.only(
        left: width * 0.05,
        top: width * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  // size: 30,
                ),
                text(
                    height * 0.0,
                    width * 0.05,
                    "${widget.allMoviesData['vote_average']}",
                    20.0,
                    Colors.amber),
                SizedBox(
                  width: 10.0,
                ),
                // text(
                //     height * 0.01,
                //     width * 0.0,
                //     "${(widget.allMoviesData['popularity'] / 100).round()}/10",
                //     13.0,
                //     Colors.white),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {
                    print("this is Download Link  :  $downloadLink");
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Stack(
                              overflow: Overflow.visible,
                              alignment: Alignment.topCenter,
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 2),
                                    height: 400,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 70, 10, 10),
                                      child: downloadLink.isEmpty == true
                                          ? Center(
                                              child: Text(
                                                  "No Server Selected Yet"),
                                            )
                                          : ListView.builder(
                                              itemCount: downloadLink.length,
                                              // itemExtent: 4,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return Column(
                                                  children: [
                                                    FlatButton(
                                                      minWidth:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      onPressed: () async {
                                                        var dio = Dio();

                                                        // downloadKey = Hive.box(
                                                        //     "downloadKey");
                                                        // downloadVal = Hive.box(
                                                        //     "downloadVal");
                                                        // // print("https://image.tmdb.org/t/p/original${widget.allMoviesData['dt_poster']}");
                                                        var link =
                                                            downloadLink[index];

                                                        // downloadKey.add(
                                                        //     "${link['title']}");
                                                        // downloadVal.put(
                                                        //     "${link['title']}",
                                                        //     {
                                                        //       'title':
                                                        //           "${link['title']}",
                                                        //       'tagline': widget
                                                        //               .allMoviesData[
                                                        //           'tagline'],
                                                        //       'image':
                                                        //           "https://image.tmdb.org/t/p/original${widget.allMoviesData['dt_poster']}",
                                                        //       'fileName': "",
                                                        //     });
var url = link['_dool_url'].toString().replaceAll("http", "https");

  final dir = Platform.isAndroid
          ? '/sdcard/download'
          : (await getApplicationDocumentsDirectory()).path;

//  await  dio.downloadUri(Uri.parse("$url"), "$dir/${link['title']}.mp4",onReceiveProgress: (actualBytes, totalBytes){
//       print((actualBytes / totalBytes) * 100) ;

var fileDownloaderProvider =
                Provider.of<FileDownloaderProvider>(context, listen: false);

                var data =   fileDownloaderProvider
        .downloadFile(
            // "https://gdplyr.2all.net/stream/720/Chi7Q2Mtdob3mKX.mp4",
            // "$url",
            // "${link['title']}.mp4")
            "https://image.shutterstock.com/image-photo/rear-side-view-front-wheel-600w-1978413569.jpg",
            "myImage.jpg")
        .then((onValue) {
          print("Come Here $onValue   ");
        // });
 });


print("this %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    ${data}");
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) =>
                                                        //             DownloadPage(
                                                        //                 widget
                                                        //                     .allMoviesData,
                                                        //                 link)));
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text(
                                                            "${downloadLink[index]['_dool_quality']}",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2,
                                                      color: Color(0xD53B3A3A),
                                                    ),
                                                  ],
                                                );
                                              }),
                                    ),
                                  ),
                                ),
                                // Positioned(
                                //   top: -60,
                                //   child: CircleAvatar(
                                //     backgroundColor: Colors.redAccent,
                                //     radius: 60,
                                //     child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                                //   )
                                // ),
                                Positioned(
                                  top: -60,
                                  child: MaterialButton(
                                    elevation: 8,
                                    height: 12,
                                    onPressed: () {},
                                    color: Colors.white,
                                    shape: CircleBorder(),
                                    child: Icon(
                                      Icons.download,
                                      size: 100,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left:
                                        MediaQuery.of(context).size.width * 0.6,
                                    top: 2,
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                          size: 25,
                                        )))
                              ],
                            ));

                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> DownloadScreen()),);

                        // final snackBar = SnackBar(
                        //   // duration: const Duration(se),
                        //   content: Container(
                        //     height: 200,
                        //     child: downloadLink.isEmpty == true
                        //         ? Center(
                        //             child: Text(
                        //             "No Server Added Yet",
                        //             style: TextStyle(color: Colors.white),
                        //           ))
                        //         : ListView.builder(
                        //             itemCount: downloadLink.length,
                        //             // itemExtent: 4,
                        //             itemBuilder: (BuildContext context, index) {
                        //               return Column(
                        //                 children: [
                        //                   FlatButton(
                        //                     minWidth:
                        //                         MediaQuery.of(context).size.width,
                        //                     onPressed: () async {
                        //                       // widget.downloadLink[index]['']

                        //                       var link = downloadLink[index];
                        //                       Navigator.push(
                        //                           context,
                        //                           MaterialPageRoute(
                        //                               builder: (context) =>
                        //                                   Download(
                        //                                       widget.allMoviesData,
                        //                                       link)));
                        //                     },
                        //                     child: Row(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.spaceAround,
                        //                       children: [
                        //                         Text(
                        //                           "${downloadLink[index]['_dool_quality']}",
                        //                           style: TextStyle(
                        //                             color: Colors.amber,
                        //                           ),
                        //                         ),
                        //                         Text(
                        //                           "${downloadLink[index]['_dool_lang']}",
                        //                           style: TextStyle(
                        //                             color: Colors.amber,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   Divider(
                        //                     thickness: 2,
                        //                     color: Color(0xD53B3A3A),
                        //                   ),
                        //                 ],
                        //               );
                        //             }),
                        //   ),
                        // );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    );
                  },
                  icon: Icon(
                    Icons.download_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () async {
                    for (var i = 0; i < favKey.length; i++) {
                      var res = favKey.getAt(i);
                      print("in Loop $res");
                      myList.add(res);
                    }
                    if (favKey.length == 0) {
                      await favVal
                          .put("${widget.allMoviesData['original_title']}", {
                        "allMoviesData": widget.allMoviesData,
                        "downloadLink": downloadLink,
                      });
                      await favKey.add(widget.allMoviesData['original_title']);
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "${widget.allMoviesData['original_title']} Added into Favorite")));
                    } else {
                      if (myList
                          .contains(widget.allMoviesData['original_title'])) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Already Added into Cart")));
                      } else {
                        if (favKey.length != 0) {
                          await favVal.put(
                              "${widget.allMoviesData['original_title']}", {
                            "allMoviesData": widget.allMoviesData,
                            "downloadLink": downloadLink,
                          });
                          await favKey
                              .add(widget.allMoviesData['original_title']);
                        }
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "${widget.allMoviesData['original_title']}",
                        )));
                      }
                    }

                    // var getKey =await favKey.add(widget.allMoviesData['original_title']);
                    //  await favVal.put("${widget.allMoviesData['original_title']}", {
                    //   "allMoviesData" : widget.allMoviesData,
                    //   "downloadLink" : widget.downloadLink,
                    // });
                    //   var res = favVal.get(widget.allMoviesData['original_title']);
                    // print(res['downloadLink'][0]['title']);

                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Favourite()),);
                  },
                  icon: Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget detailText(height, width) {
    return Container(
      margin: EdgeInsets.only(
        left: width * 0.05,
        top: width * 0.02,
        right: width * 0.05,
      ),
      child: ReadMoreText(
        '${widget.allMoviesData['content']['rendered']}',
        style: TextStyle(color: Colors.white, fontSize: 14, height: 2),
        textAlign: TextAlign.justify,
        trimLines: 5,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Details',
        trimExpandedText: 'Show less',
        moreStyle: TextStyle(
          color: Colors.amber,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget listview(height, width, popular) {
    return Container(
      height: height * 0.2,
      width: width,
      margin: EdgeInsets.only(top: height * 0.02, left: width * 0.05),
      child: ListView.builder(
        itemCount: popular.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            width: height * 0.13,
            margin: EdgeInsets.only(right: height * 0.01),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/original${popular[i]}"),
                  fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 160);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}




// https://image.tmdb.org/t/p/original/