import 'package:flutter/material.dart';
import 'package:nubiaville/utils/utils.dart';

Widget datePickerPro(title ,double containerHeight, String? selectedFromDate, String? selectedToDate, VoidCallback showdialog) {
  return GestureDetector(
    onTap: (){
      showdialog();
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
        Container(
          height: 55,
          color: litblu,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  selectedToDate!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: containerHeight > 2.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month),
                ),
              ),
            ],
          ),
        ),
      ]
    ),
  );
}