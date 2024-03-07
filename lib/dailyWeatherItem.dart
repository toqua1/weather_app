import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 ListItem(String condition, double maxTemp ,double minTemp ,String imagePath ,String date){
   if (condition == null || imagePath == null || date == null) {
     return Container();
   }
   DateTime dateTime = DateTime.parse(date);
   String dayOfWeek = DateFormat('EEE').format(dateTime);
   return Container(
     padding: EdgeInsets.only(top: 10),
     width: double.infinity,
     height: 120,
     decoration: BoxDecoration(
       color: Colors.indigo.withOpacity(0.1),
       borderRadius: BorderRadius.circular(16) ,
       boxShadow: [
         BoxShadow(
           color: Colors.black.withOpacity(0.3), // Shadow color with opacity
           spreadRadius: 5, // Spread radius
           blurRadius: 10, // Blur radius
           offset: Offset(0, 3), // Offset in the x, y direction
         ),
       ],
     ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children :[
         Container(
           width: 85,
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Text(dayOfWeek,style: TextStyle(
                 fontSize: 25 ,fontWeight: FontWeight.w700 ,fontFamily: "serif" ,color: Colors.white
               ),),
             Text(condition,style: TextStyle(
               fontSize: 15 ,fontWeight: FontWeight.w400 ,fontFamily: "serif" ,color: Colors.white70
             ),),
           ],
                  ),
         ),
       Text("${maxTemp} / ${minTemp}" ,style: TextStyle(
           fontSize: 25 ,fontWeight: FontWeight.w700 ,fontFamily: "serif" ,color: Colors.white
       ),),
         Container(
           width: 120,
           // padding: EdgeInsets.only(top: 20),
           decoration: BoxDecoration(
               image: DecorationImage(image:AssetImage(imagePath),fit: BoxFit.contain )
                 ),
           ),
     ],
     ),
   );
}