import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';
import 'package:transparent_image/transparent_image.dart';

const double _topImageHeigth = 100;
const Color _topImageOverlayColor = const Color(0xFF5924B0);

class JobsCardWidget extends StatelessWidget {
  final Job job;
  const JobsCardWidget({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0.5, 0.5),
              color: Colors.grey,
              spreadRadius: 0.01,
              blurRadius: 5,
            )
          ]),
      child: Column(
        children: [_buildTopImage(), Text(job.facility?.facName ?? "")],
      ),
    );
  }

  Widget _buildTopImage() {
    return Stack(
      fit: StackFit.loose,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: FadeInImage.memoryNetwork(
            height: _topImageHeigth,
            width: double.infinity,
            placeholder: kTransparentImage,
            image: job.facility?.imageUrl ?? "",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: _topImageHeigth,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _topImageOverlayColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Column(children: [
            Text(
              "Estimated total amount",
              style: TextStyle(color: Colors.white),
            )
          ]),
        ),
      ],
    );
  }
}


// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';
// import 'dart:ui' as ui;

/// HTML rendering

  //  @override
  // Widget build(BuildContext context) {
  //   String imageUrl = job.facility?.imageUrl ?? "";
  //   // ignore: undefined_prefixed_name
  //   ui.platformViewRegistry.registerViewFactory(
  //     imageUrl,
  //     (int _) => ImageElement()..src = imageUrl,
  //   );
  //   return Container(
  //     margin: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: const BorderRadius.all(Radius.circular(8)),
  //         boxShadow: const [
  //           BoxShadow(
  //             offset: Offset(0.5, 0.5),
  //             color: Colors.grey,
  //             spreadRadius: 0.01,
  //             blurRadius: 5,
  //           )
  //         ]),
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 100,
  //           child: HtmlElementView(
  //             viewType: imageUrl,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }