import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

const Radius _radius = Radius.circular(8);

class CalendarDesktopWidget extends StatelessWidget {
  final Job job;
  const CalendarDesktopWidget({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.maxFinite,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 50),
          CalendarCarousel<Event>(
            onDayPressed: (date, events) {},
            weekendTextStyle: TextStyle(color: Colors.grey),
            thisMonthDayBorderColor: Colors.grey,
            weekdayTextStyle: TextStyle(color: Colors.black),
            headerText: 'Jun 2021',
            headerTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
            leftButtonIcon: Icon(Icons.keyboard_arrow_left, color: Colors.grey),
            rightButtonIcon:
                Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            height: 350.0,
            width: 350.0,
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
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text("Shifts (1)",
                    style:
                        TextStyle(fontSize: 20, color: Colors.grey.shade400)),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.5, 0.5),
                        color: Colors.grey.shade400,
                        spreadRadius: 0.01,
                        blurRadius: 5)
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 32),
                      child: Icon(Icons.calendar_today_outlined,
                          color: Colors.grey.shade400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 32),
                      child: Text(job.jobStartDate,
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade400)),
                    ),
                    _buildVerticalDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 32),
                      child: Icon(Icons.wb_sunny_outlined,
                          color: Colors.grey.shade400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 32),
                      child: Text(job.jobShift,
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade400)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 1,
        height: 40,
        color: Colors.grey.shade400,
      ),
    );
  }
}
