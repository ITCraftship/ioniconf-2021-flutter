import 'package:flutter/material.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/network_image_widget.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

class InfoImageWidget extends StatelessWidget {
  final Job job;
  const InfoImageWidget({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(job.facility!.facName, style: TextStyle(fontSize: 28)),
        SizedBox(height: 30),
        Stack(
          fit: StackFit.loose,
          children: [
            ClipRRect(
              child: NetworkImageWidget(
                height: _width / 5,
                width: _width / 3,
                imageUrl: job.facility!.imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ]),
            ),
            Positioned(
                bottom: 16,
                left: 12,
                child: Column(
                  children: [
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
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
