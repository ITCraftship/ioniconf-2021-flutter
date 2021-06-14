import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/jobs/widgets/badge_widget.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';
import 'package:transparent_image/transparent_image.dart';

const double _topImageHeigth = 100;
const Color _topImageOverlayColor = const Color(0xFF5924B0);
const Color _licenceBadgeBackgroundColor = const Color(0xFFE0CBFF);
const Color _licenceBadgeTextColor = const Color(0xFF5C29B4);
const Color _statusBadgeBackgroundColor = const Color(0xFFC9DFFF);
const Color _statusBadgeAlternativeBackgroundColor = const Color(0xFFD9FFD4);
const Color _statusBadgeTextColor = const Color(0xFF01489B);
const Color _statusBadgeAlternativeTextColor = const Color(0xFF016612);

const Radius _radius = Radius.circular(8);

class JobsCardWidget extends StatelessWidget {
  final Job job;
  const JobsCardWidget({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(_radius),
          boxShadow: [BoxShadow(offset: Offset(0.5, 0.5), color: Colors.grey, spreadRadius: 0.01, blurRadius: 5)]),
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
                    child: Center(child: Text("More Details", style: TextStyle(color: _topImageOverlayColor))),
                  )
                ],
              ))
        ],
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
          child: Image(
            image: AssetImage('assets/demo_facility.jpeg'),
            height: 100,
          ),
          // FadeInImage.memoryNetwork(
          //   height: _topImageHeigth,
          //   width: double.infinity,
          //   placeholder: kTransparentImage,
          //   image: job.facility!.imageUrl,
          //   fit: BoxFit.cover,
          //   imageErrorBuilder: (_, __, ___) => Icon(Icons.error),
          // ),
        ),
        Container(
          height: _topImageHeigth,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _topImageOverlayColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(topRight: _radius, topLeft: _radius),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          text: job.jobStatus!.jobStatusText,
          backgroundColor: job.jobStatus!.jobStatusText == "Open" ? _statusBadgeAlternativeBackgroundColor : _statusBadgeBackgroundColor,
          textColor: job.jobStatus!.jobStatusText == "Open" ? _statusBadgeAlternativeTextColor : _statusBadgeTextColor,
        ),
        SizedBox(width: 8),
        BadgeWidget(
          text: job.licenseType,
          backgroundColor: _licenceBadgeBackgroundColor,
          textColor: _licenceBadgeTextColor,
        ),
      ],
    );
  }

  Widget _buildFacilityName() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SelectableText(
        job.facility!.facName,
        style: TextStyle(fontSize: 17),
        maxLines: 2,
        // overflow: TextOverflow.ellipsis,
      ));

  Widget _buildAddress() => Text(
        (job.facility!.facStreetAddress) + ", " + (job.facility!.facCity) + ", " + (job.facility!.facStateAbbreviation) + ", " + (job.facility!.facZipCode),
        style: TextStyle(fontSize: 13, color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget _buildJobSpecialtyBadges() {
    List<Widget> _jobSpecialties = [];
    if (job.jobSpecialties!.length > 1) {
      job.jobSpecialties!.forEach((jobSpecialty) {
        _jobSpecialties.add(BadgeWidget(
          text: jobSpecialty.specialty!.specialtyAcronym,
          backgroundColor: Color(int.tryParse("0xFF" + jobSpecialty.specialty!.specialtyColor.replaceAll("#", ""))!),
        ));
        _jobSpecialties.add(SizedBox(width: 10));
      });
    } else {
      Color _backgroundColor = Color(int.tryParse("0xFF" + job.jobSpecialties!.first.specialty!.specialtyColor.replaceAll("#", ""))!);
      if (job.jobSpecialties!.first.specialty!.specialtyTitle == "Skilled Nursing") {
        _backgroundColor = Color(0xFFBF4DD6);
      } else if (job.jobSpecialties!.first.specialty!.specialtyTitle == "Long Term Care") {
        _backgroundColor = Color(0xFFF6A858);
      }
      _jobSpecialties.add(BadgeWidget(text: job.jobSpecialties!.first.specialty!.specialtyTitle, backgroundColor: _backgroundColor));
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
        _iconWithInfo(Image(image: AssetImage('assets/diem.png'), height: 20), "Per Diem"),
        _iconWithInfo(Image(image: AssetImage('assets/date.png'), height: 20), job.jobStartDate),
        _iconWithInfo(Image(image: AssetImage('assets/shift.png'), height: 20), job.jobShift),
      ],
    );
  }

  Widget _iconWithInfo(Widget image, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [image, SizedBox(height: 4), Text(text, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300))],
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
