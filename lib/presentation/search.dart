import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello/dataset/dataset.dart';

enum SortingOption { byDistance, byRating, byPrice }

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int selectedIndex = -1;
  bool isTriggered = false;

  List<CoachingInstitute> instituteDummy = [];

  CoachingInstituteDataSet dataSetObject = CoachingInstituteDataSet();

  List<String> filters = ['Filters', 'Sort', '<2km', 'Jee'];

  List<IconData> icons = [
    Icons.sort,
    Icons.keyboard_arrow_down,
  ];

  SortingOption selectedSortingOption =
      SortingOption.byDistance; // Default selection

  // void _showSortingOptionsDialog(BuildContext cxt) {
  //   SortingOption newSelectedSortingOption =
  //       selectedSortingOption; // Create a temporary variable

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Sort Institutes By:'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             ListTile(
  //               leading: Radio(
  //                 value: SortingOption.byDistance,
  //                 groupValue:
  //                     newSelectedSortingOption, // Use the temporary variable
  //                 onChanged: (SortingOption? value) {
  //                   setState(() {
  //                     newSelectedSortingOption = value!;
  //                   });
  //                 },
  //               ),
  //               title: const Text('Distance'),
  //             ),
  //             ListTile(
  //               leading: Radio(
  //                 value: SortingOption.byRating,
  //                 groupValue:
  //                     newSelectedSortingOption, // Use the temporary variable
  //                 onChanged: (SortingOption? value) {
  //                   setState(() {
  //                     newSelectedSortingOption = value!;
  //                   });
  //                 },
  //               ),
  //               title: const Text('Rating'),
  //             ),
  //             ListTile(
  //               leading: Radio(
  //                 value: SortingOption.byPrice,
  //                 groupValue:
  //                     newSelectedSortingOption, // Use the temporary variable
  //                 onChanged: (SortingOption? value) {
  //                   setState(() {
  //                     newSelectedSortingOption = value!;
  //                   });
  //                 },
  //               ),
  //               title: const Text('Price'),
  //             ),
  //           ],
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               setState(() {
  //                 selectedSortingOption =
  //                     newSelectedSortingOption; // Update the selected option
  //               });
  //               Navigator.of(context).pop();
  //               // Apply the selected sorting option
  //               // (You can call a function here to apply sorting)
  //             },
  //             child: Text('Apply'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _showSortingOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Sort Institutes By:'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  selectedSortingOption = SortingOption.byDistance;
                  instituteDummy = dataSetObject.sortByDistanceAscending();
                });
                Navigator.pop(context);
              },
              child: const Text('Distance'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  selectedSortingOption = SortingOption.byRating;
                  instituteDummy = dataSetObject.sortByRatingAscending();
                });
                Navigator.pop(context);
              },
              child: const Text('Rating'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  selectedSortingOption = SortingOption.byPrice;
                  instituteDummy = dataSetObject.sortByPriceAscending();
                });
                Navigator.pop(context);
              },
              child: const Text('Price'),
            ),
          ],
        );
      },
    );
  }

  // DROP DOWN
  List<String> sortingOptions = ['Distance', 'Rating', 'Price'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    instituteDummy = dataSetObject.institutes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28.w),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      width: 36.w,
                      height: 36.h,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF7D23E0),
                        shape: CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 26.w),
                    child: Text(
                      'For JEE-Mains',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontFamily: 'Avenir Next LT Pro',
                        fontWeight: FontWeight.w600,
                        height: 1.06.h,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 39.h,
              ),
              SizedBox(
                height: 44.h,
                width: 339.w,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for UPSC Coaching',
                    hintStyle: TextStyle(
                      color: const Color(0xFF787878),
                      fontSize: 14.sp,
                      fontFamily: 'Avenir Next LT Pro',
                      fontWeight: FontWeight.w400,
                      height: 1.71.h,
                    ),
                    contentPadding: const EdgeInsets.all(14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.75.w,
                        color: const Color(0xFFBDBDBD),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.search_rounded),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 33.h,
                          width: 1.w,
                          color: const Color(0xFFBDBDBD),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: const Icon(
                            Icons.mic,
                            color: Color(0xFF7D23E0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      instituteDummy = dataSetObject.institutes
                          .where((institute) => institute.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                      log(instituteDummy.toString());
                    });
                  },
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              SizedBox(
                height: 30.h,
                width: 350.w,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  // Replace with the number of items you have
                  itemBuilder: (context, index) {
                    return index != 1
                        ? Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: GestureDetector(
                              onTap: () {
                                selectedIndex = index;
                                setState(() {});

                                if (index == 1) {
                                  _showSortingOptionsDialog();
                                } else if (index == 2) {
                                  setState(() {
                                    instituteDummy =
                                        dataSetObject.getHostelsWithin2Km();
                                  });
                                }
                              },
                              child: Container(
                                width: 79.w,
                                height: 29.h,
                                decoration: ShapeDecoration(
                                  color: selectedIndex == index
                                      ? const Color(0xff7D23E0)
                                      : Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50.w,
                                        color: const Color(0xFF7D23E0)),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      filters[index],
                                      style: TextStyle(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : const Color(0xff7D23E0),
                                        fontSize: 14.sp,
                                        fontFamily: 'Avenir Next LT Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 1.21.h,
                                        letterSpacing: 0.14,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    index <= 1
                                        ? Icon(
                                            icons[index],
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : const Color(0xff7D23E0),
                                            size: 16,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Container(
                                width: 79.w,
                                height: 29.h,
                                padding: EdgeInsets.all(3),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.50, color: Color(0xFF7D23E0)),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<SortingOption>(
                                    value: selectedSortingOption,
                                    borderRadius: BorderRadius.circular(30),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    iconSize: 14,
                                    elevation: 16,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                    ),
                                    iconDisabledColor: Color(0xFF7D23E0),
                                    iconEnabledColor: Color(0xFF7D23E0),
                                    onChanged: (SortingOption? newValue) {
                                      if (newValue != null) {
                                        setState(() {
                                          selectedSortingOption = newValue;
                                          // Apply the selected sorting option
                                          if (newValue ==
                                              SortingOption.byDistance) {
                                            instituteDummy = dataSetObject
                                                .sortByDistanceAscending();
                                          } else if (newValue ==
                                              SortingOption.byRating) {
                                            instituteDummy = dataSetObject
                                                .sortByRatingAscending();
                                          } else if (newValue ==
                                              SortingOption.byPrice) {
                                            instituteDummy = dataSetObject
                                                .sortByPriceAscending();
                                          }
                                        });
                                      }
                                    },
                                    items: sortingOptions.map((String value) {
                                      SortingOption option =
                                          SortingOption.byDistance;
                                      if (value == 'Rating') {
                                        option = SortingOption.byRating;
                                      } else if (value == 'Price') {
                                        option = SortingOption.byPrice;
                                      }

                                      return DropdownMenuItem<SortingOption>(
                                        value: option,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : const Color(0xff7D23E0),
                                            fontSize: 14.sp,
                                            fontFamily: 'Avenir Next LT Pro',
                                            fontWeight: FontWeight.w400,
                                            height: 1.21.h,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 640.h,
                width: 336.w,
                child: ListView.builder(
                  itemCount: instituteDummy.length,
                  // shrinkWrap: true,
                  // padding: EdgeInsets.only(top: 0.h),
                  scrollDirection: Axis.vertical,
                  // Replace with the number of items you have
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: instituteDummy[index].colleagues ? 20.h : 0),
                      child: SizedBox(
                        height: 200.h,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 338.w,
                                height: instituteDummy[index].colleagues
                                    ? 100.h
                                    : 0,
                                padding:
                                    EdgeInsets.only(bottom: 6.h, left: 30.w),

                                // Adjust the duration as needed

                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF6EFFE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 5.0.w,
                                          height: 5.0.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Text(
                                          '   2 of your school students study here',
                                          style: TextStyle(
                                            color: const Color(0xFF414141),
                                            fontSize: 12.sp,
                                            fontFamily: 'Avenir Next LT Pro',
                                            fontWeight: FontWeight.w400,
                                            height: 1.42.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 338.w,
                              height: 175.h,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF6EFFE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.w),
                                    child: Container(
                                      width: 157.w, // Set the desired width
                                      height: 149.h, // Set the desired height
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // Adjust the border radius as needed
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/institutePicture.png'),
                                          // Replace with your image asset
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          instituteDummy[index].name,
                                          style: TextStyle(
                                            color: const Color(0xFF272727),
                                            fontSize: 16.sp,
                                            fontFamily: 'Avenir Next LT Pro',
                                            fontWeight: FontWeight.w700,
                                            height: 1.06.h,
                                            letterSpacing: 0.16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/star.png',
                                              width: 14.w,
                                              height: 14.h,
                                            ),
                                            Text(
                                              ' ${instituteDummy[index].rating}  ',
                                              style: TextStyle(
                                                color: const Color(0xFF414141),
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    'Avenir Next LT Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 1.42.h,
                                                letterSpacing: 0.12,
                                              ),
                                            ),
                                            Container(
                                              width: 3.w,
                                              height: 3.h,
                                              decoration: const ShapeDecoration(
                                                color: Color(0xFF414141),
                                                shape: OvalBorder(),
                                              ),
                                            ),
                                            Text(
                                              '  ${instituteDummy[index].distance} away',
                                              style: TextStyle(
                                                color: const Color(0xFF414141),
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    'Avenir Next LT Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 1.42.h,
                                                letterSpacing: 0.12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        subjects(
                                            instituteDummy[index].subjects[0],
                                            instituteDummy[index].subjects[1]),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        subjects(
                                            instituteDummy[index].subjects[2],
                                            instituteDummy[index].subjects[3]),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                          width: 57.w,
                                          height: 19.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF7D23E0),
                                            // Use the color you want
                                            borderRadius: BorderRadius.circular(
                                                6), // Adjust the border radius as needed
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${instituteDummy[index].discount.toInt().toString()}%  OFF',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp,
                                                fontFamily:
                                                    'Avenir Next LT Pro',
                                                fontWeight: FontWeight.w600,
                                                height: 1.70.h,
                                                letterSpacing: 0.10,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row subjects(String s1, String s2) {
    return Row(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w, bottom: 4.h),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.40.w, color: const Color(0x777D23E0)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            s1,
            style: TextStyle(
              color: const Color(0xFF7D23E0),
              fontSize: 10.sp,
              fontFamily: 'Avenir Next LT Pro',
              fontWeight: FontWeight.w600,
              height: 1.h,
              letterSpacing: 1.20,
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 62.w,
          height: 19.h,
          padding:
              EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w, bottom: 3.h),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.40, color: Color(0x777D23E0)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            s2,
            style: TextStyle(
              color: const Color(0xFF7D23E0),
              fontSize: 10.sp,
              fontFamily: 'Avenir Next LT Pro',
              fontWeight: FontWeight.w600,
              height: 1.h,
              letterSpacing: 1.20,
            ),
          ),
        ),
      ],
    );
  }
}
