import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum HavenImageType { asset, network }

class HavenImage extends StatelessWidget {
  final String imagePath;
  final double width, height, borderRadius;
  final BoxFit fit;
  final HavenImageType imageType;
  final MainAxisAlignment imageAlignment = MainAxisAlignment.center;

  const HavenImage({
    super.key,
    required this.imagePath,
    this.width = 100.0,
    this.height = 100.0,
    this.borderRadius = 0.0,
    this.fit = BoxFit.cover,
    this.imageType = HavenImageType.asset,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: imageAlignment,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child:
              imageType == HavenImageType.asset
                  ? Image.asset(
                    imagePath,
                    width: width.w,
                    height: height.h,
                    fit: fit,
                  )
                  : Image.network(
                    imagePath,
                    width: width.w,
                    height: height.h,
                    fit: fit,
                  ),
        ),
      ],
    );
  }
}
