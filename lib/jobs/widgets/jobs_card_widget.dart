import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/network_image_widget.dart';
import 'package:ioniconf_2021_flutter/jobs/widgets/badge_widget.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

const double _topImageHeigth = 100;
const Radius _radius = Radius.circular(8);

class JobsCardWidget extends StatelessWidget {
  final Job job;
  final Function onTap;
  const JobsCardWidget({Key? key, required this.job, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
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
        child: Stack(
          children: [
            Column(
              children: [
                _buildTopImage(),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatusAndLicence(),
                      _buildFacilityName(),
                      _buildAddress(),
                      _buildJobSpecialtyBadges(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    _buildJobTypeShiftDate(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Divider(height: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Center(
                          child: Text("More Details",
                              style: TextStyle(
                                  color: ThemeColors.topImageOverlayColor))),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildTopImage() {
    return Stack(
      fit: StackFit.loose,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: _radius,
            topRight: _radius,
          ),
          child: NetworkImageWidget(
            height: _topImageHeigth,
            width: double.maxFinite,
            imageUrl: job.facility!.imageUrl!,
          ),
        ),
        Container(
          height: _topImageHeigth,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ThemeColors.topImageOverlayColor.withOpacity(0.5),
            borderRadius:
                const BorderRadius.only(topRight: _radius, topLeft: _radius),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Estimated total amount",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "\$" + job.jobPrice!.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ]),
        ),
      ],
    );
  }

  Widget _buildStatusAndLicence() {
    return Row(
      children: [
        BadgeWidget(
          text: job.jobStatus!.jobStatusText!,
          backgroundColor: job.jobStatus!.jobStatusText == "Open"
              ? ThemeColors.statusBadgeAlternativeBackgroundColor
              : ThemeColors.statusBadgeBackgroundColor,
          textColor: job.jobStatus!.jobStatusText == "Open"
              ? ThemeColors.statusBadgeAlternativeTextColor
              : ThemeColors.statusBadgeTextColor,
        ),
        SizedBox(width: 8),
        BadgeWidget(
          text: job.licenseType!,
          backgroundColor: ThemeColors.licenceBadgeBackgroundColor,
          textColor: ThemeColors.licenceBadgeTextColor,
        ),
      ],
    );
  }

  Widget _buildFacilityName() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        job.facility!.facName!,
        style: TextStyle(fontSize: 17),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ));

  Widget _buildAddress() => Text(
        (job.facility!.facStreetAddress!) +
            ", " +
            (job.facility!.facCity!) +
            ", " +
            (job.facility!.facStateAbbreviation!) +
            ", " +
            (job.facility!.facZipCode!),
        style: TextStyle(fontSize: 13, color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget _buildJobSpecialtyBadges() {
    List<Widget> _jobSpecialties = [];
    if (job.jobSpecialties!.length > 1) {
      job.jobSpecialties!.forEach((jobSpecialty) {
        _jobSpecialties.add(BadgeWidget(
          text: jobSpecialty.specialty!.specialtyAcronym!,
          /// TODO: Specialty Color
          backgroundColor: ThemeColors.licenceBadgeBackgroundColor,
          // backgroundColor: Color(int.tryParse("0xFF" +
          //     jobSpecialty.specialty!.specialtyColor.replaceAll("#", ""))!),
        ));
        _jobSpecialties.add(SizedBox(width: 10));
      });
    } else {
      /// TODO: Specialty Color
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

  Widget _buildJobTypeShiftDate() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _iconWithInfo(Image(image: AssetImage('assets/diem.png'), height: 20),
            "Per Diem"),
        _iconWithInfo(Image(image: AssetImage('assets/date.png'), height: 20),
            job.jobStartDate!),
        _iconWithInfo(Image(image: AssetImage('assets/shift.png'), height: 20),
            job.jobShift!),
      ],
    );
  }

  Widget _iconWithInfo(Widget image, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image,
        SizedBox(height: 4),
        Text(text, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300))
      ],
    );
  }
}

/// HTML rendering

// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';
// import 'dart:ui' as ui;

//   String imageUrl = job.facility.imageUrl;
//   // ignore: undefined_prefixed_name
//   ui.platformViewRegistry.registerViewFactory(
//     imageUrl,
//     (int _) => ImageElement()..src = imageUrl,
//   );

//  HtmlElementView(
//    viewType: imageUrl,
//  ),
