import 'package:flutter/material.dart';
import 'package:nubiaville/model/TransactionData.dart';


var appPurple = Color(0xFFB388FF);
var lowwhite = Color(0xFFF1F1F5);
var litblu = Color(0xFFD8DEF1);
var lowblue = Color(0xFF3A4BFF);
var dpblu =  MaterialColor(
  0xFF090F33,
  <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(0xFF3F51B5),
    600: Color(0xFF3949AB),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF090F33),
  },
);
class AppThemes {



  final MaterialColor whiteSwatch = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
}


 List<TransactionData> setStateList(){
   var transactions = <TransactionData>[];
   transactions.add(TransactionData(merchants: "Airline",dates: "03/05/2023",total: "\$439.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "BreakFast",dates: "03/06/2023",total: "\$539.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Office Supply",dates: "03/07/2023",total: "\$639.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "In Progress",comments: "Nice Product Really Love it"));
   transactions.add(TransactionData(merchants: "Airline",dates: "03/05/2023",total: "\$439.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "BreakFast",dates: "03/06/2023",total: "\$539.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Office Supply",dates: "03/07/2023",total: "\$639.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "In Progress",comments: "Nice Product Really Love it"));
   transactions.add(TransactionData(merchants: "Airline",dates: "03/05/2023",total: "\$439.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "BreakFast",dates: "03/06/2023",total: "\$539.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Office Supply",dates: "03/07/2023",total: "\$639.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "In Progress",comments: "Nice Product Really Love it"));
   transactions.add(TransactionData(merchants: "Airline",dates: "03/05/2023",total: "\$439.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "BreakFast",dates: "03/06/2023",total: "\$539.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Office Supply",dates: "03/07/2023",total: "\$639.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "In Progress",comments: "Nice Product Really Love it"));
   transactions.add(TransactionData(merchants: "Airline",dates: "03/05/2023",total: "\$439.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "BreakFast",dates: "03/06/2023",total: "\$539.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Office Supply",dates: "03/07/2023",total: "\$639.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "New",comments: "Nice Product"));
   transactions.add(TransactionData(merchants: "Shuttle",dates: "03/08/2023",total: "\$739.17",status: "In Progress",comments: "Nice Product Really Love it"));

   return transactions;
}
