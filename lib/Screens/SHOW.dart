
import 'package:egybest/Screens/downloadScreen.dart';
import 'package:egybest/Screens/favorite.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tmdb_easy/easyTMDB.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hive/hive.dart';
import 'webView.dart';

// import 'videoPlay.dart';

class SHOW extends StatefulWidget {
  final allMoviesData,downloadLink;
  SHOW(this.allMoviesData,this.downloadLink);

  @override
  _SHOWState createState() => _SHOWState();
}

class _SHOWState extends State<SHOW> {


  var favKey;
  var favVal;
  List myList =[];

    @override
  void initState() {
    super.initState();

    favKey = Hive.box("favKey");
    favVal = Hive.box("favVal");

    setState(() {
          
        });
    // popularMovies();
  }


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





  @override
  Widget build(BuildContext context) {
    print(widget.allMoviesData);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


  

    return Scaffold(
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
                      padding: EdgeInsets.only(left: width * 0.05,top:10),
                      child: Text("Release Date : ",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),)),

                 text(height * 0.01, width * 0.05, "${widget.allMoviesData['release_date']}",
                    13.0, Colors.white),

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
            playButton(height, width , widget.allMoviesData['repeatable_fields']),
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
            image: NetworkImage("https://image.tmdb.org/t/p/original${widget.allMoviesData['dt_backdrop']}"),
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
            image: NetworkImage("https://image.tmdb.org/t/p/original${widget.allMoviesData['dt_poster']}"),
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



           final snackBar = SnackBar(
              // duration: const Duration(se),
              content: Container(
                height: 200,
                child: response == "" ? Center(child: Text("No Server Added Yet",style: TextStyle(color:Colors.white),)) :   ListView.builder(
                    itemCount: response.length,
                    // itemExtent: 4,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          FlatButton(
                            minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              // widget.downloadLink[index]['']
                              var link = widget.downloadLink[index];
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Web(response[index]['url'])));

                            },
                            child: Text(
                              "${response[index]['name']}",
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color:  Color(0xD53B3A3A),
                          ),
                        ],
                      );
                    }),
              ),
              
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

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

          Row(children: [
            
          Container(
            margin: EdgeInsets.only( right: 5),
            child: IconButton(
              onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> DownloadScreen()),);


                
            final snackBar = SnackBar(
              // duration: const Duration(se),
              content: Container(
                height:  200,
                child: widget.downloadLink.length == 0 ? Center(child: Text("No Server Added Yet",style: TextStyle(color:Colors.white),)) : ListView.builder(
                    itemCount: widget.downloadLink.length,
                    // itemExtent: 4,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          FlatButton(
                            minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              // widget.downloadLink[index]['']
                              var link = widget.downloadLink[index];
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Download()));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                
                                Text(
                                  "${widget.downloadLink[index]['_dool_quality']}",
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),

                                Text(
                                  "${widget.downloadLink[index]['_dool_lang']}",
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color:  Color(0xD53B3A3A),
                          ),
                        ],
                      );
                    }),
              ),
              
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(
                Icons.download_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Builder(
            builder: (context){
            return IconButton(
              onPressed: ()async{

                // favKey.clear();
                // favVal.clear();
                // print(favKey.getAt(0));
                // favVal.put(getKey , {
                //   "allMoviesData" : widget.allMoviesData,
                //   "downloadLink" : widget.downloadLink,
                // });


       for (var i = 0; i < favKey.length; i++) {
      var res = favVal.get(favKey.getAt(i));
      print("in Loop $res");
      myList.add(res);
     
    }


                if (favKey.length == 0) {
      await favVal.put("${widget.allMoviesData['original_title']}", {
                  "allMoviesData" : widget.allMoviesData,
                  "downloadLink" : widget.downloadLink,
                });
      await favKey.add(widget.allMoviesData['original_title']);
      Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("${widget.allMoviesData['original_title']} Added into Favorite")));
    } else {
      if (myList.contains(widget.allMoviesData['original_title'])) {
        Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Already Added into Cart")));
      } else {
        if (favKey.length != 0) {
            await favVal.put("${widget.allMoviesData['original_title']}",  {
                  "allMoviesData" : widget.allMoviesData,
                  "downloadLink" : widget.downloadLink,
                });
            await favKey.add(widget.allMoviesData['original_title']);
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
          ],),

          SizedBox(width: 10,),
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

  Widget listview(height, width,popular) {
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
              image:
                  DecorationImage(image:  NetworkImage(
                    "https://image.tmdb.org/t/p/original${popular[i]}"), fit: BoxFit.cover),
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