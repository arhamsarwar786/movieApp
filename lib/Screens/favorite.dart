import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tmdb_easy/easyTMDB.dart';
// import 'package:hive_flutter/adapters.dart';

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
        // leading: Icon(
        //   Icons.arrow_back,
        //   size: 26,
        // ),
        backgroundColor: Colors.black,
        title: Text(
          "Favorite",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),


      floatingActionButton: FloatingActionButton(onPressed: (){
        var my  =  tmdb.genres().movie().then((value) => print(value.toJson()));
        
      },),
      body: SafeArea(
        child:favKey.length != 0 ? Container(
          color: Colors.black,
          child: ListView.builder(
           
          itemCount: favKey.length,
            itemBuilder: (context,index){
             var data = favVal.get("${favKey.getAt(index)}");
              
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
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
                            height: 80,
                            width: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://image.tmdb.org/t/p/original${data['allMoviesData']['dt_poster']}"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, ),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data['allMoviesData']['title']['rendered']}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${data['allMoviesData']['tagline']}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
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
                      Row(
                        children: [
                          Container(
                            // height: 80,
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xff3DD818),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    child: Text(
                                      "MP3",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "256 KBPS",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 12),
                            child: Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "DOWNLODE COMPLETE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "220.2 MB",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(width: 30,),
                          Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(icon: Icon(Icons.delete,color: Colors.amber,                       
                              ),onPressed: (){
                                 setState(
                                      () {
                                        favVal.delete("${data}");
                                        favKey.deleteAt(index);
                                      },
                                    );
                              },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          
          }
             
          ),
        ):Container(),
      ),
    );
  }
}
