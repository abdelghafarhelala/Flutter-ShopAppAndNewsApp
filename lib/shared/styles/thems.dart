import 'package:flutter/material.dart';


ThemeData darkThem=ThemeData(

            inputDecorationTheme: new InputDecorationTheme(
            
            prefixIconColor: Colors.grey,
            fillColor: Colors.white,
            focusColor:  Colors.white,
            hoverColor:  Colors.white,
              labelStyle: new  TextStyle(
                  color: Colors.grey,
              ),
              hintStyle: new TextStyle(color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                
                //  when the TextFormField in focused 
              ) ,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                
                //  when the TextFormField in unfocused 
              ) ,
            ),
    
    
             primarySwatch: Colors.blue,
        
            textTheme: TextTheme(
            button:TextStyle(
              fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
            ) ,
              
              bodyText1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              )
            ),
            scaffoldBackgroundColor: Colors.black12,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
               backgroundColor: Colors.black,
               unselectedItemColor: Colors.grey[200],
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              elevation: 20,
            ),
            // appBarTheme: AppBarTheme(
            //   backgroundColor: Colors.white24,
            //   elevation: 0,
            //   shadowColor: Colors.white,
            //   titleTextStyle: TextStyle(
            //     color: Colors.black
            //   )
            // )
          );


ThemeData lightThem=ThemeData(

            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.grey[200],
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              elevation: 20,
            ),
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white24, 
              
            )
          );