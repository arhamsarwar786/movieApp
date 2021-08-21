import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       body: SafeArea(
         child: Stack(
           children: [
       
            
             Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  
                //  colorFilter: new ColorFilter.mode(
                //   Colors.white.withOpacity(0.3), BlendMode.dstATop),
                  image: AssetImage("assets/image.jpeg"),
                  fit:BoxFit.fitHeight,),
              ),
             ),
             SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.only(left:8.0,right: 8),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Center(
                       child: Container(
                         height:100 ,
                         width: 150,
                         decoration: BoxDecoration(
                           image: DecorationImage(image: 
                           AssetImage("assets/logo (2).png"))
                         ),
                       ),
                     ),
             
             
             
                     Text(
                          "AL MADINAH FOODS provides you best Quality, Hygienic and Homemade frozen and desi stuff. We made it simpler for you to order food online and offline if you don’t want to cook. Order your favorite and desired food with just one click and enjoy your meal on your doorstep. Initially it was started a year ago and our clients are liked our food as well as our services. We delivered best healthy foods in our town. Cooked in a very clean environment with hygienic and natural masalas and ingredients. Our Frozen stuff is fully preserved and fresh. Your health is our first priority. We made it with pure things. BECAUSE PURITY MATTERS. We are providing you different foods i.e. Desi, Chinese, Deserts, Fast Food, Indian foods, Frozen stuff and many more.\n In this Pandemic our customers faced difficulties to take their order physically. So, we arranged a fully functional and dynamic food App for you. In Which You Order your desired food easily with internet. Unlike other Applications that delivered online food. We offer you ordering food offline too via MESSAGE OR CALL.\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "FEATURES:\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("•",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("In this app you can order your food with  different methods.",style: TextStyle(color: Colors.white),),
                          )),
                        ],),
                         Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("•",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("It is fully functional and dynamic application.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                          Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("•",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("It provides you different Categorized Food Menus.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                         Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("•",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("It also provides you recent offers and events of Al-MADINAH FOODS.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                         Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("•",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("It also provides you user authentication features.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("•",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("It uses different animations and transition that inspired users.",style: TextStyle(color: Colors.white)),
                          ),),
                        ],),
                         Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("•",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("It is user-friendly food application.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                        ///   Why Us ///
                     
                        Text(
                          "\n WHY US? \n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("o",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("If you can’t cook. You can order us and beat your hunger",style: TextStyle(color: Colors.white),),
                          )),
                        ],),
                         Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("o",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("When Guests accidently come and you have nothing to cook. Order our appetizing Frozen stuff.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                          Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("o",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("Wanna ,feel lazy to dine out ?",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                         Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("o",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("Wanna, enjoy Homemade taste in your Office Lunch.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                         Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("o",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("Wanna, try something new and different.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("o",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("Using natural and healthy ingredients in our foods.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                         Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                          Text("o",style: TextStyle(color: Colors.white),),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text("Offering different discount on delivery and foods.",style: TextStyle(color: Colors.white),),
                          ),),
                        ],),
                      
                        Text(
                          "\nThanks for choosing us.\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          "Hope you like our Services for more info may visit our social media pages and review us on GooglePlayStore.\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
               ),
             ),
               




               ],
             ),
             
      
         ),
         );
       
  }
}