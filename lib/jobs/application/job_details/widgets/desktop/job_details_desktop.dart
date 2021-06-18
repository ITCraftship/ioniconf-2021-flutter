import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';
import 'package:ioniconf_2021_flutter/jobs/widgets/badge_widget.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

class JobDetailsDesktop extends StatelessWidget {
  final Job job;
  const JobDetailsDesktop({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          Text("Job Status",
              style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
          SizedBox(height: 8),
          BadgeWidget(
            text: job.jobStatus!.jobStatusText!,
            backgroundColor: job.jobStatus!.jobStatusText == "Open"
                ? ThemeColors.statusBadgeAlternativeBackgroundColor
                : ThemeColors.statusBadgeBackgroundColor,
            textColor: job.jobStatus!.jobStatusText == "Open"
                ? ThemeColors.statusBadgeAlternativeTextColor
                : ThemeColors.statusBadgeTextColor,
          ),
          SizedBox(height: 20),
          Text("Speciality",
              style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
          _buildJobSpecialtyBadges(),
          Text("Type of Job",
              style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
          SizedBox(height: 10),
          Text(job.jobType!, style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text("Licence Type",
              style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
          SizedBox(height: 10),
          Text(job.licenseType!, style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text("Rate",
              style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
          SizedBox(height: 10),
          Text("\$" + job.jobPrice!.toStringAsFixed(2) + "/Hr",
              style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text("Number of beds",
              style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
          SizedBox(height: 10),

          /// TODO: facNumberOfBeds
          Text("96", style: TextStyle(fontSize: 18)),
          // Text(job.facility!.facNumberOfBeds.toString(),
          //     style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text("Job Instructions",
              style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
          SizedBox(height: 10),
          Text(
            job.jobDescription!,
            style: TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildJobSpecialtyBadges() {
    List<Widget> _jobSpecialties = [];
    if (job.jobSpecialties!.length > 1) {
      job.jobSpecialties!.forEach((jobSpecialty) {
        _jobSpecialties.add(BadgeWidget(
          text: jobSpecialty.specialty!.specialtyAcronym!,

          /// TODO: specialtyColor
          backgroundColor: ThemeColors.licenceBadgeBackgroundColor,
          // backgroundColor: Color(int.tryParse("0xFF" +
          //     jobSpecialty.specialty!.specialtyColor.replaceAll("#", ""))!),
        ));
        _jobSpecialties.add(SizedBox(width: 10));
      });
    } else {
      /// TODO: specialtyColor
      Color _backgroundColor = ThemeColors.licenceBadgeBackgroundColor;
      // Color _backgroundColor = Color(int.tryParse("0xFF" +
      //     job.jobSpecialties!.first.specialty!.specialtyColor
      //         .replaceAll("#", ""))!);
      if (job.jobSpecialties!.first.specialty!.specialtyTitle ==
          "Skilled Nursing") {
        _backgroundColor = Color(0xFFBF4DD6);
      } else if (job.jobSpecialties!.first.specialty!.specialtyTitle ==
          "Long Term Care") {
        _backgroundColor = Color(0xFFF6A858);
      }
      _jobSpecialties.add(BadgeWidget(
          text: job.jobSpecialties!.first.specialty!.specialtyTitle!,
          backgroundColor: _backgroundColor));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: _jobSpecialties),
    );
  }
}
