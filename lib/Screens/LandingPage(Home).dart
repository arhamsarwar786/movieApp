import 'package:dots_indicator/dots_indicator.dart';
import 'package:egybest/Screens/Profile.dart';
import 'package:egybest/Screens/TV_Grid.dart';
import 'package:egybest/Screens/favorite.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:navigation_dot_bar/navigation_dot_bar.dart';
import 'package:tmdb_easy/easyTMDB.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'BottomBar.dart';
import 'GridShow.dart';
import 'MoviePlay.dart';
import 'SHOW.dart';
import 'SeasonsGrid.dart';
import 'movieScreen.dart';
import 'translate.dart';
import 'search.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  var tmdb = EasyTMDB("05902896074695709d7763505bb88b4d");
  double i = 0.0;
  var point = 0;
  CarouselController carouselController = CarouselController();
  var allMoviesData = [];

  // getMoviesById() async {
  //   for (var id in moviesId) {
  //     http.Response data = await http.get(
  //         "https://api.themoviedb.org/3/movie/$id?api_key=05902896074695709d7763505bb88b4d");
  //     if (data != null) allMoviesData.add(jsonDecode(data.body));
  //   }
  //   print(allMoviesData.length);
  // }

  var lang;
  var data;

  dynamic moviesDataWp,
      downloadLink = [
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        []
      ];

    var tvShow;

      getTVData()async{

         var data =  await http.get("https://xegybest.com/wp-json/wp/v2/tvshows");
          tvShow =  jsonDecode(data.body);
          setState(() {
                      
                    });
      }
  getAllDataWP() async {
    print("Enter into WP Function");
    data = await http.get("https://xegybest.com/wp-json/wp/v2/movie").timeout(Duration(minutes: 1));
    // var download =
    //     await http.get("https://xegybest.com/wp-json/wp/v2/dt_links");
    // var downloadLinkAll = jsonDecode(download.body);

    // print(data.statusCode);
    moviesDataWp = jsonDecode(data.body);
    // print(downloadLinkAll[0]['title']['rendered']);
    // print(moviesDataWp[0]['original_title']);
    // bool d = moviesDataWp[0]['original_title'] ==
    //     downloadLinkAll[0]['title']['rendered'];
    // print(d);

    

    print(downloadLink);
    // print("wait $moviesDataWp");

    // if (data != null) {
    // if (data.statusCode == 200) {
    //   print("200 Status Code");
    //   setState(() {
    //     moviesDataWp = jsonDecode(data.body);
    //   });
    // } else if (data.statusCode == 408 || data.statusCode == null || data == null) {

    //   data = await http.get("https://xegybest.com/wp-json/wp/v2/movie");

    //     moviesDataWp = jsonDecode(data.body);
    // }
    // } else {
    // print("data is Null Now $data");
    // }
    setState(() {});

    // print("Left Function");
  }

  @override
  void initState() {
    super.initState();
    // getMoviesById();
    // topRatedMovies();
    // popularMovies();
    // upComingMovies();
    getAllDataWP();
    genresVal();
    getTVData();

    // var lang = Hive.openBox("lang");
    // Translate.myCon();
  }

  dynamic genres = [Tab(
          text: "All",
        ),];
  genresVal() async {
    // tmdb.genres().movie().then((value) {
    //   var data = value.toJson();
    //   for (var item in data['genres']) {
    //     genres.add(Tab(
    //       text: item['name'],
    //     ),
    //     );
    //   }
    setState(() {});
    // });
    print(genres);
  }

  var topRated, popular, upComing;

  // Top Rated Movies
  topRatedMovies() async {
    tmdb.movie().topRated().then((value) {
      print("Enter");
      topRated = value.toJson();

      var posterImages, backdropImages;
      for (int i = 0; i < topRated['results'].length; i++) {
        var poster = topRated['results'][i]["poster_path"];
        var backdrop = topRated['results'][i]["backdrop_path"];
        posterImages = poster.toString().replaceAll("http", "https");
        backdropImages = backdrop.toString().replaceAll("http", "https");
        topRated['results'][i]["poster_path"] = posterImages;
        topRated['results'][i]["backdrop_path"] = backdropImages;
      }
      setState(() {});
    });
    print(topRated);
  }

  // Popular Movies
  popularMovies() async {
    tmdb.movie().popular().then((value) {
      // print("Enter");
      popular = value.toJson();
      var posterImages, backdropImages;
      for (int i = 0; i < popular['results'].length; i++) {
        var poster = popular['results'][i]["poster_path"];
        var backdrop = popular['results'][i]["backdrop_path"];
        posterImages = poster.toString().replaceAll("http", "https");
        backdropImages = backdrop.toString().replaceAll("http", "https");
        popular['results'][i]["poster_path"] = posterImages;
        popular['results'][i]["backdrop_path"] = backdropImages;
      }
      setState(() {});
    });
    // print(popular);
  }

  // upComing Movies
  upComingMovies() async {
    tmdb.movie().upcoming().then((value) {
      // print("Enter");
      upComing = value.toJson();
      var posterImages, backdropImages;
      for (int i = 0; i < upComing['results'].length; i++) {
        var poster = upComing['results'][i]["poster_path"];
        var backdrop = upComing['results'][i]["backdrop_path"];
        posterImages = poster.toString().replaceAll("http", "https");
        backdropImages = backdrop.toString().replaceAll("http", "https");
        upComing['results'][i]["poster_path"] = posterImages;
        upComing['results'][i]["backdrop_path"] = backdropImages;
      }
      setState(() {});
    });
    // print(popular);
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    var size = MediaQuery.of(context).size;
    return
    //  (genres == null) || (moviesDataWp == null)
    //     ? Center(
    //         child: CircularProgressIndicator(),
    //       )
    //     : 
        DefaultTabController(
            length: genres.length == null ? 0 : genres.length,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.black,
                bottomNavigationBar: BottomNavigationDot(
                  paddingBottomCircle: 21,
                  color: Colors.white,
                  backgroundColor: Color(0xff181818),
                  activeColor: Colors.amber,
                  items: [
                    BottomNavigationDotItem(
                        icon: Icons.home,
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Landing()),
                          // );
                        }),
                    BottomNavigationDotItem(
                        icon: Icons.search,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Searching()),
                          );
                        }),
                    BottomNavigationDotItem(
                        icon: Icons.favorite,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Favourite()),
                          );
                        }),
                    BottomNavigationDotItem(
                        icon: Icons.download_sharp,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Landing()),
                          );
                        }),
                    BottomNavigationDotItem(
                        icon: Icons.account_circle_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        }),
                  ],
                  milliseconds: 22,
                  // milliseconds: 400,
                ),
                appBar: AppBar(
                  backwardsCompatibility: false,
                  backgroundColor: Color(0xff181818),
                  centerTitle: true,
                  title: Image.asset(
                    "assets/images/egybest.png",
                    height: 40,
                  ),
                  bottom: TabBar(
                    // indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2,
                    indicatorPadding: EdgeInsets.only(right: 30, left: 30),
                    indicatorColor: Colors.amber,
                    isScrollable: true,
                    tabs: genres,

                    // ListView.builder(itemBuilder: (context, i ){
                    //   return [ Tab(
                    //   text: "${genres[i]['name']}",
                    // );],
                    // },itemCount: genres.length,)
                    // Tab(
                    //   text: "  ACTION ",
                    // ),
                    // Tab(
                    //   text: "ADVENTURE",
                    // ),
                    // Tab(
                    //   text: " THRILLER ",
                    // ),
                    // Tab(
                    //   text: "ROMANTIC ",
                    // ),
                    // Tab(
                    //   text: " TV SHOW ",
                    // ),
                    // Tab(
                    //   text: " SEASON  ",
                    // ),
                    // Tab(
                    //   text: "  DRAMA  ",
                    // ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          // var p = tmdb.search().movie("Action").then((value) => print(value.toJson()));
                          // tmdb.find().externalItem('28', "Action").then((value) => print(value.toJson()));
                          // tmdb
                          //     .people()
                          //     .movieCredits(28)
                          //     .then((value) => print(value.toJson()));
                          genresVal();

                          // print(res);

                          // https://api.themoviedb.org/3/person/28/movie_credits?api_key=05902896074695709d7763505bb88b4d
                        },
                        icon: Icon(
                          Icons.notifications_none,
                          color: Colors.amber,
                          // size: 3.h,
                        )),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
//                       TabBarView(children:
//                        [
//                           //  for (var i = 0; i < genres.length; i++) Center(child: Text("A",style: TextStyle(color: Colors.white),)),
// Center(child: Text("A",style: TextStyle(color: Colors.white),)),

//                       ]),

                      moviesDataWp == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : caroselSlider(size.width, size.height),
                      //  popular == null ? Center(child: CircularProgressIndicator(),)   : moviesList(
                      //           size.width, size.height, 'TOP TRENDING', popular),
                      //    upComing == null ? Center(child: CircularProgressIndicator(),)   :    moviesList(size.width, size.height, "NEWEST", upComing),
                      moviesDataWp == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : moviesList(
                              size.width, size.height, "MOVIES", moviesDataWp),
                      Divider(
                        thickness: 1,
                        color: Colors.amber,
                      ),

                       tvShow == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : tvShows(
                              size.width, size.height, "TV SHOWS", tvShow),
                      Divider(
                        thickness: 1,
                        color: Colors.amber,
                      ),


                      
                      // moviesDataWp == null
                      //     ? Center(child: CircularProgressIndicator())
                      //     : moviesList(
                      //         size.width, size.height, "MOVIES", topRated),
                      // Container(
                      //   // margin: EdgeInsets.only(top: height * 0.01),
                      //   decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     //  border: Border.all(color: Colors.white)
                      //   ),
                      //   child: Column(children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Row(children: [
                      //               Container(
                      //                 width: 4,
                      //                 height: 18,
                      //                 color: Colors.amber,
                      //                 margin: EdgeInsets.only(left: width * 0.05),
                      //               ),
                      //               Container(
                      //                 margin: EdgeInsets.only(left: width * 0.01),
                      //                 child: Text("MOVIES",
                      //                     style: TextStyle(
                      //                       fontSize: 15.0,
                      //                       color: Colors.white,
                      //                       fontWeight: FontWeight.bold,
                      //                     )),
                      //               ),
                      //             ]),
                      //             Container(
                      //               child: MaterialButton(
                      //                 onPressed: () {},
                      //                 child: Text("SEE ALL",
                      //                     style: TextStyle(
                      //                       fontSize: 15.0,
                      //                       color: Colors.white,
                      //                       fontWeight: FontWeight.bold,
                      //                     )),
                      //               ),
                      //             )
                      //           ],
                      //         ),
                    ],
                  ),
                  //         ]),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ),
              ),
            ));
  }

  Widget caroselSlider(width, height) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.02, bottom: height * 0.01),
          child: CarouselSlider.builder(
              // carouselController: carouselController,

              options: CarouselOptions(
                height: height * 0.23,
                // aspectRatio: 16/2,
                // viewportFraction: 0.65,
                viewportFraction: 1,
                // initialPage: 1,
                enableInfiniteScroll: true,
                // reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),

                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                // onPageChanged: callbackFunction,

                scrollDirection: Axis.horizontal,
              ),
              itemCount: moviesDataWp.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                // setState(() {
                // });

                // var d = carouselController.animateToPage(point);
                // d.whenComplete(() {
                //   setState(() {
                //     point = itemIndex;
                //   });
                // });
                return Container(
                  margin:
                      EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/original${moviesDataWp[itemIndex]['dt_backdrop']}"),
                    fit: BoxFit.cover,
                  )),
                );
              }),
        ),
        SingleChildScrollView(
          child: DotsIndicator(
            dotsCount: 6,
            position: point.toDouble(),
            decorator: DotsDecorator(
              size: Size.square(6.0),
              activeSize: Size(25.0, 6.0),
              activeColor: Colors.amber,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)),
            ),
          ),
        )
      ],
    );
  }

  Widget listView(width, height) {
    List icons = [
      Icons.movie_creation_outlined,
      Icons.screen_lock_landscape_outlined,
      Icons.child_friendly_outlined,
      Icons.filter_drama_sharp
    ];
    List text = ["MOVIES", "SERIES", "KIDS CONTENT", "DRAMAS"];
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      color: Color(0xff636363),
      width: width,
      height: height * 0.09,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              alignment: Alignment.center,
              height: height * 0.1,
              margin: EdgeInsets.only(
                left: width * 0.07,
                right: width * 0.07,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: height * 0.01),
                    child: Icon(
                      icons[i],
                      color: Colors.yellow,
                    ),
                  ),
                  Text(
                    text[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget moviesList(width, height, text, moviesData) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                width: 4,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: EdgeInsets.only(left: width * 0.05),
              ),
              Container(
                margin: EdgeInsets.only(left: width * 0.01),
                child: Text("$text",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ]),
            Container(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Grid(moviesDataWp)));
                },
                child: Text(
                  "SEE ALL",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: height * 0.235,
          margin: EdgeInsets.only(
            left: width * 0.05,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: moviesData.length,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SHOW(moviesData[i]),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    right: width * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.165,
                        width: width * 0.27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original${moviesData[i]['dt_poster']}"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.27,
                        margin: EdgeInsets.only(
                          top: height * 0.02,
                        ),
                        child: Text(
                          "${moviesData[i]['original_title']}",
                          style: TextStyle(fontSize: 8.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }


  
  Widget tvShows(width, height, text, tvData) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                width: 4,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: EdgeInsets.only(left: width * 0.05),
              ),
              Container(
                margin: EdgeInsets.only(left: width * 0.01),
                child: Text("$text",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ]),
            Container(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TVGrid(tvData)));
                },
                child: Text(
                  "SEE ALL",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: height * 0.235,
          margin: EdgeInsets.only(
            left: width * 0.05,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tvData.length,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                onTap: () async{
                   var seasons = [];
                      var data = await http.get("https://xegybest.com/wp-json/wp/v2/seasons");
                      var res = jsonDecode(data.body);
                      // print(d[0]);

                      for (var j = 0; j < res.length; j++) {
                      var d = res[j]['title']['rendered'].toString().split(":");
                      if (tvData[i]['title']['rendered'] == d[0]) {
                        seasons.add(res[j]);
                      }
                        
                      }
                      // seasons.reversed;
                      print(seasons);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SeasonsGrid(seasons.reversed.toList())));
                },
                child: Container(
                  margin: EdgeInsets.only(
                    right: width * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.165,
                        width: width * 0.27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original${tvData[i]['dt_poster']}"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.27,
                        margin: EdgeInsets.only(
                          top: height * 0.02,
                        ),
                        child: Text(
                          "${tvData[i]['title']['rendered']}",
                          style: TextStyle(fontSize: 8.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
