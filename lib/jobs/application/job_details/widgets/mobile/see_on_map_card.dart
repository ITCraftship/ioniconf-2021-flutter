import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/network_image_widget.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';

const double _topImageHeigth = 180;
const Radius _radius = Radius.circular(8);

class SeeOnMapCard extends StatelessWidget {
  final Job job;
  const SeeOnMapCard({Key? key, required this.job}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 300,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildFacilityName(),
                    _buildAddress(),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Divider(height: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Center(
                        child: Text("See on the Map",
                            style: TextStyle(
                                color: ThemeColors.topImageOverlayColor))),
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
            ),
            SizedBox(height: 60),
            Text(
              "Nurse pay",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "\$" + job.jobPrice!.toStringAsFixed(2) + "/Hr",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ]),
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
        textAlign: TextAlign.center,
      ));

  Widget _buildAddress() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (job.facility!.facStreetAddress!) +
                ", " +
                (job.facility!.facCity!) +
                ", " +
                (job.facility!.facStateAbbreviation!) +
                ", " +
                (job.facility!.facZipCode!),
            style: TextStyle(
                fontSize: 13, color: ThemeColors.licenceBadgeTextColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.location_pin,
            color: ThemeColors.toolBarColor,
          ),
        ],
      );
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
