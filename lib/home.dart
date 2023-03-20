import 'dart:ffi';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nubiaville/model/TransactionData.dart';
import 'package:nubiaville/utils/date_picker.dart';
import 'package:nubiaville/utils/utils.dart';
import 'package:nubiaville/widget/widget.dart';

import 'filepicker.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Map<String, dynamic> _xlsxData;

  List<dynamic> data = [];

  void _importExcel() async {
    try {
      // Show file picker dialog
      FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['xlsx']);

      if (result != null) {
        // Get file path from result
        String filePath = result.files.single.path!;
        // Read Excel file and parse data
        var bytes = File(filePath).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        // Get data from Excel file
        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            setState(() {
              data.add(row);
            });
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
  File? _image;

  Future<void> _importImage() async {
    // Show image picker dialog
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  List<TransactionData> transactions = [];


  double containerHeight = 0.0;
  String _selectedFromDate = "";
  String _selectedToDate = "";
  bool isExpanded = false;
  String _selectedItem = '';

  @override
  void initState() {
    setState(() {
     transactions =  setStateList();

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        onPressed: () {
          setState(() {
            transactions.add(TransactionData(merchants: "Airline",dates: "03/10/2023",comments: "Nice Product",status: "New",total: "\$3,000"));
          });
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            color: lowwhite,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'To be reimbursed',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '\$13952.42',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  'Filters',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                      if (isExpanded) {
                        containerHeight += 600.0;
                      } else {
                        containerHeight -= 600.0;
                      }
                    });
                  },
                  icon: Icon(Icons.sort, color: Colors.blue),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            height: containerHeight,
            duration: Duration(milliseconds: 150),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Container(
                    height: containerHeight,
                    color: lowwhite,
                    child: SingleChildScrollView( // add SingleChildScrollView
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(children: [
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                _showFromDatePickerDialog();
                              },
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("From", style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                    Container(
                                      height: 55,
                                      color: litblu,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              _selectedFromDate,
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
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                _showToDatePickerDialog();
                              },
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("To", style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                    Container(
                                      height: 55,
                                      color: litblu,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              _selectedToDate,
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
                            ),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Min", style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                    Spacer(),
                                    Text("Max", style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                    Spacer(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Customet(),
                                    Text("   -   "),
                                    Customet(),
                                  ],
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("Merchant", style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: litblu,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                child: ListView.builder(
                                                  itemCount: transactions.length,
                                                  itemBuilder: (
                                                      BuildContext context,
                                                      int index) {
                                                    return ListTile(
                                                      title: Text("${transactions[index].merchants!}"),
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedItem =
                                                          transactions[index].merchants!;
                                                          print(_selectedItem);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  _selectedItem.isEmpty
                                                      ? 'Select Merchant'
                                                      : _selectedItem,
                                                  style: TextStyle(fontSize: 16,
                                                      fontWeight: FontWeight
                                                          .bold),
                                                ),
                                              ),
                                              Icon(Icons.arrow_drop_down),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            )
                          ]
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
      SingleChildScrollView(
        child: Column(
          children:[
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13
              ),),

              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text("Merchant",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12
                ),),
              ),

              Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

              Text("Status",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

              Text("Comment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
            ],
          ),

        ]
        ),
      ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: transactions.length, // replace with the actual number of items you have
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0,left: 10,right: 10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(transactions[index].dates!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13
                          ),),

                          Text(
                            transactions[index].merchants!.length >7
                                ? '${transactions[index].merchants!.substring(0, 4)}...'
                                : transactions[index].merchants!,
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),
                          ),

                          Text(transactions[index].total!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
                          Text(
                            transactions[index].status!,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: transactions[index].status!.contains('New') ? Colors.red : Colors.black,
                            ),
                          ),
                          Text(transactions[index].comments!.length > 13 ?'${transactions[index].comments!.substring(0,10)}...' :'${transactions[index].comments}',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500)),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),


        ],
      ),
    );
  }

  void _showFromDatePickerDialog() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1988, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _selectedFromDate = "${picked.month}/${picked.day}/${picked.year}";
      });
    }
  }

  void _showToDatePickerDialog() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1988, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _selectedToDate = "${picked.month}/${picked.day}/${picked.year}";
      });
    }
  }

  List<DateTime> getDatesBetween(DateTime fromDate, DateTime toDate) {
    List<DateTime> dates = [];
    for (DateTime date = fromDate; date.isBefore(toDate); date = date.add(Duration(days: 1))) {
      dates.add(date);
    }
    dates.add(toDate); // add the last date to the list
    return dates;
  }

}
