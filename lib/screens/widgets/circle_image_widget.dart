import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentapp_provider/core/colors.dart';

class CircleImageWidget extends StatelessWidget {
  final double radius;
  final String? image;
  const CircleImageWidget({
    super.key,
    required this.radius,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            backgroundImage: FileImage(File(image!)),
            radius: radius,
          )
        : CircleAvatar(
            backgroundColor: kBlack,
            radius: radius,
            child: Icon(
              Icons.image,
              color: kWhite.withOpacity(0.7),
            ),
          );
  }
}
