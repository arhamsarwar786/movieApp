import 'package:flutter/material.dart';


class About extends StatefulWidget {

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      backgroundColor: Colors.black87,
        leading: IconButton(onPressed: (){},
        icon:Icon(Icons.arrow_back,color: Colors.white,) ,),
        title:Text("FAQ",style: TextStyle( color:Colors.white,fontSize: 25),),
        centerTitle:true,
      ),
      body: SafeArea(
        child: Container(
          height:MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width ,
          color: Colors.black,
         child: SingleChildScrollView(
           child: Column(children: [
             
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
                          child: Column(children: [
                                         
                      Container(
                         decoration: BoxDecoration(
                           gradient: LinearGradient(
                               begin: Alignment.topLeft,
                               end: Alignment.bottomLeft,
                                   colors:   [
                                      Color(0xffBCB6B0).withOpacity(0.2),
                                     Colors.white.withOpacity(0.2),
                                      Color(0xffBCB6B0).withOpacity(0.2),
                                   ]
                                   ),
                         ),
                         child: ExpansionTile(
                          collapsedIconColor: Colors.amber,
                                        
                            title: Text(
                              "What is Benefits",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500,color: Colors.amber),
                            ),
                            children: <Widget>[
                              ListTile(
                                
                                title: Text(
                                  "What is Expansion Tile Widget in Flutter ? Expansion is Similar to Expandable CardView in android,Using this Expansion Tile Widget one can Tap on the card to Expands or just collapses the view of the children inside it.. In other words, ",
                                  style: TextStyle(color: Colors.white,fontSize: 15),
                                ),
                              ),
                            ],
                           ),
                          ),
                          SizedBox(height: 5,),
                                        
                         Container(
                             decoration: BoxDecoration(
                           gradient: LinearGradient(
                               begin: Alignment.topLeft,
                               end: Alignment.bottomLeft,
                                   colors:   [
                                      Color(0xffBCB6B0).withOpacity(0.2),
                                     Colors.white.withOpacity(0.2),
                                      Color(0xffBCB6B0).withOpacity(0.2),
                                   ]
                                   ),
                         ),
                          child: ExpansionTile(
                            collapsedIconColor: Colors.amber,
                                                    
                              title: Text(
                                "What is Benefits",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500,color: Colors.amber),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "What is Expansion Tile Widget in Flutter ? Expansion is Similar to Expandable CardView in android,Using this Expansion Tile Widget one can Tap on the card to Expands or just collapses the view of the children inside it.. In other words, ",
                                    style: TextStyle(color: Colors.white,fontSize: 15),
                                  ),
                                ),
                              ],
                          ),
                        ),
                                        SizedBox(height: 5,),
                                         Container(
                           decoration: BoxDecoration(
                           gradient: LinearGradient(
                               begin: Alignment.topLeft,
                               end: Alignment.bottomLeft,
                                   colors:   [
                                      Color(0xffBCB6B0).withOpacity(0.2),
                                     Colors.white.withOpacity(0.2),
                                      Color(0xffBCB6B0).withOpacity(0.2),
                                   ]
                                   ),
                         ),
                        child: ExpansionTile(
                          collapsedIconColor: Colors.amber,
                            title: Text(
                              "How can i Pay Easily", 
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500,color: Colors.amber),
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "What is Expansion Tile Widget in Flutter ? Expansion is Similar to Expandable CardView in android,Using this Expansion Tile Widget one can Tap on the card to Expands or just collapses the view of the children inside it.. In other words, ",
                                  style: TextStyle(color: Colors.white,fontSize: 15),
                                ),
                              ),
                            ],
                        ),
                                         ),
                                        SizedBox(height: 5,),
         
                                         Container(
                           decoration: BoxDecoration(
                           gradient: LinearGradient(
                               begin: Alignment.topLeft,
                               end: Alignment.bottomLeft,
                                   colors:   [
                                      Color(0xffBCB6B0).withOpacity(0.2),
                                     Colors.white.withOpacity(0.2),
                                      Color(0xffBCB6B0).withOpacity(0.2),
                                   ]
                                   ),
                         ),
                        child: ExpansionTile(
                          collapsedIconColor: Colors.amber,
                              
                                        
                            title: Text(
                              "How can i get more  Benefits",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500,color: Colors.amber),
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "What is Expansion Tile Widget in Flutter ? Expansion is Similar to Expandable CardView in android,Using this Expansion Tile Widget one can Tap on the card to Expands or just collapses the view of the children inside it.. In other words, ",
                                  style: TextStyle(color: Colors.white,fontSize: 15),
                                ),
                              ),
                            ],
                        ),
                                         ),
                              
                              
                              
                              
                              
                              
                              
                              
                          ],),
                        ),
           ],),
         ),


        ),
      ),    
    );
  }
}










 