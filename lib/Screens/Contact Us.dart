import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}
class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                       child: Container(
                         height:60 ,
                         width: 130,
                         decoration: BoxDecoration(
                           image: DecorationImage(image: 
                           AssetImage("assets/images/egybest.png"))
                         ),
                       ),
                     ),

                Container(
                  decoration:BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
          "Contact Form",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          "Have something to notify our support team, please do not hesitate to use this form",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 1,
          color: Colors.white,
        ),
                    ],
                  ),
                ),
                   
                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(children: [
      
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           new Flexible(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
               Text(
                 "Name",
                 style: TextStyle(color: Colors.white),
               ),
               SizedBox(
                 height: 8,
               ),
               TextField(
                 style: TextStyle(
                   color: Colors.white
                 ),
                 textAlign: TextAlign.start,
                 decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.white70, width: 2.0),
                   ),
                   contentPadding:
                       EdgeInsets.only(top: 10, left: 10),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Color(0xff40dedf),
                     ),
                   ),
                 ),
               ),
           ],
         ),
           ),
           SizedBox(
         width: 30.0,
           ),
           new Flexible(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
               Text(
                 "Email",
                 style: TextStyle(color: Colors.white),
               ),
               SizedBox(
                 height: 8,
               ),
               TextField(
                 style: TextStyle(color: Colors.white),
                
  keyboardType: TextInputType.emailAddress,
                 textAlign: TextAlign.start,
                 decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.white70, width: 2.0),
                   ),
                   contentPadding:
                       EdgeInsets.only(top: 20, left: 20),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Color(0xff40dedf),
                     ),
                   ),
                 ),
               ),
           ],
         ),
           ),
         ],
       ),
       SizedBox(height: 20,),
       Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
               Text(
                 "Subject",
                 style: TextStyle(color: Colors.white),
               ),
               
               Text(
                 "How can we help?",
                 style: TextStyle(color: Colors.grey,fontSize: 13),
               ),
               SizedBox(
                 height: 8,
               ),
               TextField(
                 style: TextStyle(color: Colors.white),

                 textAlign: TextAlign.start,
                 decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.white70, width: 2.0),
                   ),
                   contentPadding:
                       EdgeInsets.only(top: 20, left: 20),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Color(0xff40dedf),
                     ),
                   ),
                 ),
               ),
           ],
         ),


          SizedBox(height: 20,),
       Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
               Text(
                 "Your message",
                 style: TextStyle(color: Colors.white),
               ),
               
               Text(
                 "The more descriptive you can be the better we can help.",
                 style: TextStyle(color: Colors.grey,fontSize: 13),
               ),
               SizedBox(
                 height: 8,
               ),
               TextField(
                 style: TextStyle(color: Colors.white),
                 maxLines: 6,
                 textAlign: TextAlign.start,
                 decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.white70, width: 2.0),
                   ),
                   contentPadding:
                       EdgeInsets.only(top: 20, left: 20),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Color(0xff40dedf),
                     ),
                   ),
                 ),
               ),
           ],
         ),
           
      
      
       SizedBox(height: 20,),
       Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
               Text(
                 "Link Reference (optional)",
                 style: TextStyle(color: Colors.white),
               ),
               SizedBox(
                 height: 8,
               ),
               TextField(
                 style: TextStyle(color: Colors.white),

                 textAlign: TextAlign.start,
                 decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.white70, width: 2.0),
                   ),
                   contentPadding:
                       EdgeInsets.only(top: 20, left: 20),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Color(0xff40dedf),
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 width: double.infinity,
                 child: MaterialButton(
                   onPressed: (){},
                   child: Text("Send",style: TextStyle(fontSize: 20),),
                   textColor: Colors.black,
                   color: Colors.amber,
                   elevation: 0,
                   focusColor: Colors.grey,
                   focusElevation: 0,
                 ),
               ),
           ],
         ),
      
      
      
      
                     ],),
                   )
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
