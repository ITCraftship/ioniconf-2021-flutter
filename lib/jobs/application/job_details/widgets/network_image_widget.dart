import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NetworkImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  const NetworkImageWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      height: height,
      width: width,
      placeholder: kTransparentImage,
      image: imageUrl,
      fit: BoxFit.cover,
      imageErrorBuilder: (_, __, ___) => Icon(Icons.error),
    );
  }
}
