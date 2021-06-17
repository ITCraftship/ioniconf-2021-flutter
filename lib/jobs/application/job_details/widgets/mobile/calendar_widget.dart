import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

const Radius _radius = Radius.circular(8);

class CalendarWidget extends StatelessWidget {
  final Job job;
  const CalendarWidget({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(_radius),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.5, 0.5),
                color: Colors.grey,
                spreadRadius: 0.01,
                blurRadius: 5)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Text("Shifts in this job", style: TextStyle(fontSize: 22)),
          ),
          CalendarCarousel<Event>(
            onDayPressed: (date, events) {},
            weekendTextStyle: TextStyle(color: Colors.grey),
            thisMonthDayBorderColor: Colors.grey,
            weekdayTextStyle: TextStyle(color: Colors.black),
            headerText: 'Jun 2021',
            headerTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
            leftButtonIcon:
                Icon(Icons.keyboard_arrow_left, color: Colors.grey),
            rightButtonIcon:
                Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            height: 300,
            width: 300,
            showIconBehindDayText: true,
            customGridViewPhysics: NeverScrollableScrollPhysics(),
            isScrollable: false,
            markedDateShowIcon: true,
            markedDateIconMaxShown: 2,
            todayTextStyle: TextStyle(color: Colors.white),
            todayButtonColor: ThemeColors.toolBarColor,
            todayBorderColor: Colors.grey,
            markedDateMoreShowTotal: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text("Shifts (1)", style: TextStyle(fontSize: 22)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.wb_sunny, color: Colors.yellow),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("1x8 Hours", style: TextStyle(fontSize: 14)),
          ),
          Container(
              width: double.maxFinite, child: Divider(endIndent: 8, indent: 8)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.yellow),
                    SizedBox(height: 8),
                    Text("Shifts 1", style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(job.jobShift, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text(job.jobStartDate, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
