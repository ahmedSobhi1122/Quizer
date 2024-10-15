import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../resources/app_values.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    super.key,
    required this.imageUrl,
    this.width = AppSize.s100,
    this.height = AppSize.s100,
    this.backgroundColor,
    this.borderColor,
  });

  final String imageUrl;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.whiteColor,
        shape: BoxShape.circle,
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: AppSize.s1,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
            : null,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: imageUrl.contains('http')
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return const Skeletonizer(
                    enabled: true, child: SizedBox.shrink());
              },
            )
          : imageUrl.contains('cache')
              ? Image.memory(
                  File(imageUrl).readAsBytesSync(),
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
    );
  }
}
