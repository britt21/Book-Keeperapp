import 'package:flutter/material.dart';

import '../utils/utils.dart';

Widget Customet() {
  return Expanded(
    child: Container(
      height: 55,
      color: litblu,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("\$",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    ),
  );

}