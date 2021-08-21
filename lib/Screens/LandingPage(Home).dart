import 'dart:io';
import 'dart:math';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:egybest/Screens/Download.dart';
import 'package:egybest/Screens/Profile.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:egybest/Screens/TV_Grid.dart';
import 'package:egybest/Screens/downloadScreen.dart';
import 'package:egybest/Screens/favorite.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:navigation_dot_bar/navigation_dot_bar.dart';
import 'package:tmdb_easy/easyTMDB.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'BottomBar.dart';
import 'GridShow.dart';
import 'MoviePlay.dart';
import 'SHOW.dart';
import 'SeasonsGrid.dart';
import 'Setting.dart';
import 'movieScreen.dart';
import 'translate.dart';
import 'search.dart';

String lang = 'en';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  myFun() {
    setState(() {
      lang = 'ar';
    });
  }

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
  // var data;

  // initFun() async {

  //   tran
  //       .translate(
  //     widget.name,
  //     to: lang,
  //   )
  //       .then((value) {
  //     setState(() {
  //       val = value.toString();
  //     });
  //     print(value);
  //   });
  // }

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

  getTVData() async {
    try {
      var data = await http.get("https://xegybest.com/wp-json/wp/v2/tvshows");

      setState(() {
        tvShow = jsonDecode(data.body);
      });

      return tvShow;
    }
    // throw SocketException("No Internet ");
    on SocketException catch (e) {
      print(e);
      throw NoInternetException('No Internet');
    } catch (e) {
      // print("Enter into Catch ");

      // print("CATCH :    ::    $e");
    }
  }

  getAllDataWP() async {
    try {
      // print("Enter into TRY");
      var data = await http.get("https://xegybest.com/wp-json/wp/v2/movie");
      setState(() {
        moviesDataWp = jsonDecode(data.body);
        // mayLike = moviesDataWp;
        // mayLike..shuffle();
        // latestMovie = moviesDataWp;
        // mayLike = latestMovie.shuffle();
      });
      return moviesDataWp;
    } on SocketException catch (e) {
      print(e);
      throw NoInternetException('No Internet');
    } catch (e) {
      // print("Enter into Catch ");

      // print("CATCH :    ::    $e");
    }
  }

  dynamic sliderData;
  Future getSlider() async {
    try {
      // print("Enter into TRY sider");
      var data = await http.get("https://xegybest.com/wp-json/wp/v2/movie");
      setState(() {
        sliderData = jsonDecode(data.body);
        // latestMovie = moviesDataWp;
        // latestMovie = randomChoice(latestMovie);
      });
      return sliderData;
    } on SocketException catch (e) {
      print(e);
      throw NoInternetException('No Internet');
    } catch (e) {
      // print("Enter into Catch ");

      // print("CATCH  :::  $e");
    }
  }

  dynamic latestMovie, mayLike = [];

  latestMovies() {
    //  for (var i = mayLikeData.length; i > 0 ; i--) {
    //    print(mayLikeData[i-1]);
    //  }
    setState(() {
      if (moviesDataWp == null) {
        print("Movie Data NULL  Now");
      }
      else{

      mayLike = moviesDataWp;
      mayLike..shuffle();
      }
    });
    // return mayLike;
    //  for (var i = 0; i < 5 ; i++) {
    //    latestMovie.add(moviesDataWp[i]);
    // }

    // for (var i = moviesDataWp.length; i > 5 ; i--) {
    //    mayLike.add(moviesDataWp[i]);
    // }
  }

  @override
  void initState() {
    super.initState();
    // getMoviesById();
    // topRatedMovies();
    // popularMovies();
    // upComingMovies();
    // getAllDataWP();
    // genresVal();
    // getTVData();
    latestMovies();

    // var lang = Hive.openBox("lang");
    // Translate.myCon();
  }

  static dynamic genres = <Widget>[];
  genresVal() async {
    tmdb.genres().movie().then((value) {
      var data = value.toJson();
      print(data);

      // for (var i = 0; i < data['genres']; i++) {

      // }
      for (var item in data['genres']) {
        genres.add(
          Tab(
            text: "${item['name']}",
          ),
        );
        // genres.add(item['name']);
      }
      setState(() {});
    });
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

  bool check = false;

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
        ModalProgressHUD(
      inAsyncCall: check,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.amber,
      ),
      child: DefaultTabController(
          length: 5,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Landing()),
                        );
                      }),
                  BottomNavigationDotItem(
                      icon: Icons.search,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Searching()),
                        );
                      }),
                  BottomNavigationDotItem(
                      icon: Icons.favorite,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Favourite()),
                        );
                      }),
                  BottomNavigationDotItem(
                      icon: Icons.download_sharp,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DownloadPage()),
                        );
                      }),
                  BottomNavigationDotItem(
                      icon: Icons.account_circle_rounded,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Setting(myFun)),
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
                    tabs: [
                      Tab(
                        text: "  ACTION ",
                      ),
                      Tab(
                        text: "ADVENTURE",
                      ),
                      Tab(
                        text: " THRILLER ",
                      ),
                      Tab(
                        text: "ROMANTIC ",
                      ),
                      Tab(
                        text: " TV SHOW ",
                      ),
                    ]

                    // Tab(
                    //   text: " SEASON  ",
                    // ),
                    // Tab(
                    //   text: "  DRAMA  ",
                    // ),
                    ),
                actions: [
                  IconButton(
                      onPressed: () async{
                        // Hive.box("downloadKey").clear();
                        // Hive.box("favKey").clear();
                        // Hive.box("downloadVal").clear();
                        // Hive.box("favVal").clear();
                        // Hive.box("userDetail").clear();
                        // Hive.box("userKey").clear();
                        // var p = tmdb.search().movie("Action").then((value) => print(value.toJson()));
                        // tmdb.find().externalItem('28', "Action").then((value) => print(value.toJson()));
                        // tmdb
                        //     .people()
                        //     .movieCredits(28)
                        //     .then((value) => print(value.toJson()));
                        // genresVal();
                        // latestMovies();


      var data = await http.get("https://xegybest.com/wp-json/wp/v2/movie");
      var dd   =   jsonDecode(data.body);
      print(dd[0]['genres']);


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
                    // RefreshIndicator(
                    //   onRefresh: getSlider,),
                        FutureBuilder(
                          future: getSlider(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData)
                              return caroselSlider(size.width, size.height);
                            else if (snapshot.hasError) {
                              if (snapshot.error is NoInternetException) {
                                NoInternetException noInternetException =
                                    snapshot.error as NoInternetException;
                                //  return showError(noInternetException.message)
                                return Center(
                                  child: ElevatedButton.icon(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Colors.red;
                                          return Colors
                                              .amber; // Use the component's default.
                                        },
                                      ),
                                    ),
                                    onPressed: () {
                                      getSlider();
                                    },
                                    icon: Icon(Icons.refresh),
                                    label: Text('Refresh'),
                                  ),
                                );
                              }

                              if (snapshot.error is NoServiceFoundException) {
                                NoServiceFoundException
                                    noServiceFoundException =
                                    snapshot.error as NoServiceFoundException;
                                return Center(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      getAllDataWP();
                                    },
                                    icon: Icon(Icons.design_services),
                                    label: Text(
                                        '${noServiceFoundException.message}'),
                                  ),
                                );
                              }
                              if (snapshot.error is InvalidFormatException) {
                                InvalidFormatException invalidFormatException =
                                    snapshot.error as InvalidFormatException;
                                return Center(
                                  child: ElevatedButton.icon(
                                      onPressed: () {
                                        getAllDataWP();
                                      },
                                      icon: Icon(
                                          Icons.insert_invitation_outlined),
                                      label: Text(
                                          '${invalidFormatException.message}')),
                                );
                              }
                              UnknownException unknownException =
                                  snapshot.error as UnknownException;
                              return Center(
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      getAllDataWP();
                                    },
                                    icon: Icon(Icons.device_unknown_outlined),
                                    label: Text('${unknownException.message}')),
                              );
                            }

                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    

                    FutureBuilder(
                        future: getAllDataWP(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return moviesList(size.width, size.height, "MOVIES",
                                moviesDataWp);
                          else if (snapshot.hasError) {
                            if (snapshot.error is NoInternetException) {
                              NoInternetException noInternetException =
                                  snapshot.error as NoInternetException;
                              //  return showError(noInternetException.message)
                              return Center(
                                child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return Colors.red;
                                        return Colors
                                            .amber; // Use the component's default.
                                      },
                                    ),
                                  ),
                                  onPressed: () {
                                    getAllDataWP();
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.refresh),
                                  label: Text('Refresh'),
                                ),
                              );
                            }

                            if (snapshot.error is NoServiceFoundException) {
                              NoServiceFoundException noServiceFoundException =
                                  snapshot.error as NoServiceFoundException;
                              return Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    getAllDataWP();
                                  },
                                  icon: Icon(Icons.design_services),
                                  label: Text(
                                      '${noServiceFoundException.message}'),
                                ),
                              );
                            }
                            if (snapshot.error is InvalidFormatException) {
                              InvalidFormatException invalidFormatException =
                                  snapshot.error as InvalidFormatException;
                              return Center(
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      getAllDataWP();
                                    },
                                    icon:
                                        Icon(Icons.insert_invitation_outlined),
                                    label: Text(
                                        '${invalidFormatException.message}')),
                              );
                            }
                            UnknownException unknownException =
                                snapshot.error as UnknownException;
                            return Center(
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    getAllDataWP();
                                  },
                                  icon: Icon(Icons.device_unknown_outlined),
                                  label: Text('${unknownException.message}')),
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),

                    Divider(
                      thickness: 1,
                      color: Colors.amber,
                    ),













                    // moviesDataWp == null
                    //     ? Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     : caroselSlider(size.width, size.height),
                    //  popular == null ? Center(child: CircularProgressIndicator(),)   : moviesList(
                    //           size.width, size.height, 'TOP TRENDING', popular),
                    //    upComing == null ? Center(child: CircularProgressIndicator(),)   :    moviesList(size.width, size.height, "NEWEST", upComing),
                    //                     moviesDataWp == null
                    //                         ? Center(
                    //                             child: CircularProgressIndicator(),
                    //                           )
                    //                         : moviesList(
                    //                             size.width, size.height, "MOVIES", moviesDataWp),
                    // Divider(
                    //   thickness: 1,
                    //   color: Colors.amber,
                    // ),

                    // mayLike.isEmpty == true 
                    //     ? Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     : moviesList(size.width, size.height, "MAY BE YOU LIKE",
                    //         mayLike),
                    //                     Divider(
                    //                       thickness: 1,
                    //                       color: Colors.amber,
                    //                     ),
                    //  latestMovie == null
                    //                         ? Center(
                    //                             child: CircularProgressIndicator(),
                    //                           )
                    //                         : moviesList(
                    //                             size.width, size.height, "LASTEST MOVIES", latestMovie),
                    //                     Divider(
                    //                       thickness: 1,
                    //                       color: Colors.amber,
                    //                     ),

                    //                     tvShow == null
                    //                         ? Center(
                    //                             child: CircularProgressIndicator(),
                    //                           )
                    //                         : tvShows(size.width, size.height, "TV SHOWS", tvShow),
                    //                     Divider(
                    //                       thickness: 1,
                    //                       color: Colors.amber,
                    //                     ),
                  ],
                ),
                //         ]),
                //       )
                //     ],
                //   ),
                // ),
              ),
            ),
          )),
    );
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
              itemCount: sliderData.length,
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
                        "https://image.tmdb.org/t/p/original${sliderData[itemIndex]['dt_backdrop']}"),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Grid(moviesDataWp)));
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
                      builder: (context) => SHOW(moviesData[i]),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TVGrid(tvData)));
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
                onTap: () async {
                  setState(() {
                    check = true;
                  });
                  var seasons = [];
                  var data = await http
                      .get("https://xegybest.com/wp-json/wp/v2/seasons");
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

                  setState(() {
                    check = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SeasonsGrid(seasons.reversed.toList())));
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

class NoInternetException {
  String message;
  NoInternetException(this.message);
}

class NoServiceFoundException {
  String message;
  NoServiceFoundException(this.message);
}

class InvalidFormatException {
  String message;
  InvalidFormatException(this.message);
}

class UnknownException {
  String message;
  UnknownException(this.message);
}
