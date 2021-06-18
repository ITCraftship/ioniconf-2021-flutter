import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';
import 'package:ioniconf_2021_flutter/jobs/widgets/badge_widget.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

const Radius _radius = Radius.circular(8);

class JobDetailsCard extends StatelessWidget {
  final Job job;
  const JobDetailsCard({Key? key, required this.job}) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text("Speciality",
                style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
            _buildJobSpecialtyBadges(),
            Text("Type of Job",
                style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
            SizedBox(height: 10),
            Text(job.jobType!, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Licence Type",
                style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
            SizedBox(height: 10),
            Text(job.licenseType!, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Number of beds",
                style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
            SizedBox(height: 10),
            Text(job.facility!.facNumberOfBeds!.toString(),
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Job Instructions",
                style: TextStyle(color: ThemeColors.licenceBadgeTextColor)),
            SizedBox(height: 10),
            Text(
              job.jobDescription!,
              style: TextStyle(fontSize: 18),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildJobSpecialtyBadges() {
    List<Widget> _jobSpecialties = [];
    if (job.jobSpecialties!.length > 1) {
      job.jobSpecialties!.forEach((jobSpecialty) {
        _jobSpecialties.add(BadgeWidget(
          text: jobSpecialty.specialty!.specialtyAcronym!,
          backgroundColor: Color(int.tryParse("0xFF" +
              jobSpecialty.specialty!.specialtyColor!.replaceAll("#", ""))!),
        ));
        _jobSpecialties.add(SizedBox(width: 10));
      });
    } else {
      Color _backgroundColor = Color(int.tryParse("0xFF" +
          job.jobSpecialties!.first.specialty!.specialtyColor!
              .replaceAll("#", ""))!);
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
