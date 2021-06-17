import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';
import 'package:ioniconf_2021_flutter/jobs/widgets/badge_widget.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

const Radius _radius = Radius.circular(4);

class ShiftLicenceCard extends StatelessWidget {
  final Job job;
  const ShiftLicenceCard({Key? key, required this.job}) : super(key: key);

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
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildElements(title: "Shift Date", widget: Text(job.jobStartDate)),
        _buildVerticalDivider(),
        _buildElements(title: "Shift Time", widget: Text(job.jobShift)),
        _buildVerticalDivider(),
        _buildElements(
          title: "Licence Type",
          widget: BadgeWidget(
            text: job.licenseType,
            backgroundColor: ThemeColors.licenceBadgeBackgroundColor,
            textColor: ThemeColors.licenceBadgeTextColor,
          ),
        ),
      ]),
    );
  }

  Widget _buildVerticalDivider() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 1,
        height: 40,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildElements({required String title, required Widget widget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                title,
                style: TextStyle(color: ThemeColors.licenceBadgeTextColor),
              ),
            ),
            widget,
          ]),
    );
  }
}
