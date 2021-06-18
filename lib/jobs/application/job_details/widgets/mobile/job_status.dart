import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';
import 'package:ioniconf_2021_flutter/jobs/widgets/badge_widget.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

const Radius _radius = Radius.circular(8);

class JobStatusWidget extends StatelessWidget {
  final Job job;
  const JobStatusWidget({Key? key, required this.job}) : super(key: key);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Job Status", style: TextStyle(fontSize: 24)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: BadgeWidget(
              text: job.jobStatus!.jobStatusText!,
              backgroundColor: job.jobStatus!.jobStatusText == "Open"
                  ? ThemeColors.statusBadgeAlternativeBackgroundColor
                  : ThemeColors.statusBadgeBackgroundColor,
              textColor: job.jobStatus!.jobStatusText == "Open"
                  ? ThemeColors.statusBadgeAlternativeTextColor
                  : ThemeColors.statusBadgeTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
