import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tmdb_easy/easyTMDB.dart';

import 'SHOW.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  var favVal;

  var favKey;

  var tmdb = EasyTMDB("05902896074695709d7763505bb88b4d");

  @override
  void initState() {
    super.initState();

    favVal = Hive.box("favVal");
    favKey = Hive.box("favKey");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Favorite",
          style: TextStyle(color: Colors.amber, fontSize: 35),
        ),
      ),
      
      body: SafeArea(
        child: favKey.length != 0
            ? Container(
                color: Colors.black,
                child: ListView.builder(
                    itemCount: favKey.length,
                    itemBuilder: (context, index) {
                      var data = favVal.get("${favKey.getAt(index)}");

                      return InkWell(
                        onTap: (){
                          print(data);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SHOW(data['allMoviesData'])));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: double.infinity,
                                child: Card(
                                  elevation: 0,
                                  color: Colors.black54,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://image.tmdb.org/t/p/original${data['allMoviesData']['dt_poster']}"),

                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${data['allMoviesData']['title']['rendered'] }",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${data['allMoviesData']['tagline']}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      width: 75.0,
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        color: Colors.amber,
                                                      ),
                                                      onPressed: () {
                                                        setState(
                                                          () {
                                                            favVal.delete(
                                                                "${data}");
                                                            favKey
                                                                .deleteAt(index);
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.amber,
                                // thickness: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : Center(
              child: Text("Favorite is Empty"),
            ),
      ),
    );
  }
}