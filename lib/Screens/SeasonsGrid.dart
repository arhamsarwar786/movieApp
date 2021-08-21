import 'dart:convert';

import 'package:egybest/Screens/episodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'SHOW.dart';
class SeasonsGrid extends StatefulWidget {
  final seasons;
  SeasonsGrid(this.seasons);

  @override
  _SeasonsGridState createState() => _SeasonsGridState();
}

class _SeasonsGridState extends State<SeasonsGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backwardsCompatibility: true,
        title: Text(
          "SEASONS",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: widget.seasons.isEmpty == true ? Container(
          height: MediaQuery.of(context).size.height,
          
          
          child:  Center(child: Text("No SEASONS ADDED YET",style: TextStyle(color: Colors.white),),),
          
        ) :  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.amber,
                    ),
                    height: 20,
                    width: 4,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // Text(
                  //   "Movies:",
                  //   style: TextStyle(
                  //     color: Colors.amber,
                  //     fontSize: 35,
                  //   ),
                  // ),
                ],
              ),
            ),
            StaggeredGridView.countBuilder(
              staggeredTileBuilder: (int index) => new StaggeredTile.count(1,
                  1.75 // (MediaQuery.of(context).size.width > 400) ? 1.3 : 1.4,
                  ),
              crossAxisCount: 3,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.seasons.length,
              padding: EdgeInsets.only(top: 20, right: 12, left: 12),
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 25,
              crossAxisSpacing: 20,

              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () async{
                    var episodes = [] ; 
                      var data = await http.get("https://xegybest.com/wp-json/wp/v2/episodes");
                      var res = jsonDecode(data.body);
                      // print(d[0]);

                      for (var i = 0; i < res.length; i++) {
                        var f = widget.seasons[index]['title']['rendered'].toString().split(":");
                      var d = res[i]['title']['rendered'].toString().split(":");
                      print("this is f : $f %%%%  this is d $d");
                      if ( f[0] == d[0]) {
                        episodes.add(res[i]);
                      }
                        
                      }
                      print(episodes.length);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Episodes(widget.seasons[index], episodes.reversed.toList())));
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage("https://image.tmdb.org/t/p/original${widget.seasons[index]['dt_poster']}"),
                                fit: BoxFit.cover),
                            border: Border.all(color: Colors.white, width: 1),
                           
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                           
                        padding: EdgeInsets.only(
                            left: 10,
                            top: (MediaQuery.of(context).size.width > 450)
                                ? 40.0
                                : 10,
                            bottom: 10),
                        // decoration: BoxDecoration(
                        child: Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.seasons[index]['title']['rendered']}",
                                style: TextStyle(
                                    fontSize:
                                        (MediaQuery.of(context).size.width >
                                                450)
                                            ? 25.0
                                            : 13,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w900),
                              ),
                            
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}