import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

class MoviePlay extends StatefulWidget {
  final tvData;
  MoviePlay(this.tvData);

  @override
  _MoviePlayState createState() => _MoviePlayState();
}

class _MoviePlayState extends State<MoviePlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back,color:Colors.white70,size: 30,),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.9,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black12, BlendMode.colorBurn),
                  image: NetworkImage("https://image.tmdb.org/t/p/original${widget.tvData['dt_poster']}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Positioned(
          //   left: 0,
      
          //   right: 0,
          //   bottom: 0,
      
          // child:
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black54,
            ),
          ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left:10.0,bottom: 10,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Peter on Holidays",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2.5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "3 Season",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "90 Episods",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "Adventure",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "English",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              size: 28,
                              color: Colors.white,
                            ),
                            Text(
                              "Start Watching",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      size: 35,
                      color: Colors.white,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                      child: Icon(
                        Icons.download_done_outlined,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing",
                  style: TextStyle(color: Colors.white, 
                  fontSize: 10),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Seasons",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 9,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Reviews",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 8,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Season 1",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 8.5,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Season 2",
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 8,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Season 3",
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 8,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: MediaQuery.of(context).size.height*0.16,
                  width: double.infinity,
                  child: ListView.builder(
                    // itemExtent: 2,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index)
                    {
                    return  Stack(
                      children:[ 
                        Opacity(
                          opacity: 0.8,
                          child: Container(
                            margin: EdgeInsets.all(5),
                                            height:150,
                                            width: 200,
                                            decoration: BoxDecoration(
                                            image: DecorationImage(
                                            image:AssetImage("assets/image4.jpeg"),
                              fit: BoxFit.cover, 
                              ),
                          ),
                                              ),
                        ),
                      Column(mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       Row(
                         children: [
                           Icon(Icons.play_arrow,size: 25,color: Colors.white,),
                           Column(crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("S1 E1",style: TextStyle(color:Colors.white,fontSize: 20),),
                               Text("This is how it started",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                             ],
                           ),

                         ],
                       ),

                      ],)
                     ] 
                       );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
