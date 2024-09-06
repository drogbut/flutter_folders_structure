import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  final String imageUrl;
  final double width, height, borderRadius;
  final bool isNetworkImage;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  const TRoundedImage({
    required this.imageUrl,
    this.width = 350,
    this.height = 158,
    super.key,
    this.isNetworkImage = false,
    this.border,
    this.backgroundColor = DColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.borderRadius = TSizes.md,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
          border: border,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(TSizes.md),
            child: Image(
              image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}