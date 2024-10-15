
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizer/core/resources/assets_manager.dart';

class DisplayRate extends StatelessWidget {
  final double rating;

  const DisplayRate({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return SvgPicture.asset(SVGAssets.fullStar);
        } else if (index < rating) {
          return SvgPicture.asset(SVGAssets.halfStar);
        } else {
          return SvgPicture.asset(SVGAssets.emptyStar);
        }
      }),
    );
  }
}