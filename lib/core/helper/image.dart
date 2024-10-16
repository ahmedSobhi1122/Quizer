import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:quizer/core/helper/extensions.dart';
import 'package:quizer/core/resources/assets_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageManager extends StatelessWidget {
  final String? url;

  const ImageManager({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return _getImage(url);
  }

  Widget _getImage(String? url) {
    if (url.isNullOrEmpty()) {
      return Image.asset(ImageAssets.defaultImage);
    }

    if (url!.startsWith("http")) {
      return _networkImage(url);
    } else if (url.endsWith(".svg")) {
      return SvgPicture.asset(url);
    } else if (url.endsWith(".json") || url.endsWith(".gif")) {
      return Lottie.asset(url);
    } else if (url.contains('cache')) {
      return _cachedImage(url);
    } else {
      return Image.asset(url);
    }
  }

  Widget _networkImage(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) {
        return const Skeletonizer(enabled: true, child: SizedBox.shrink());
      },
    );
  }

  Widget _cachedImage(String path) {
    try {
      return Image.memory(
        File(path).readAsBytesSync(),
        fit: BoxFit.cover,
      );
    } catch (e) {
      return Image.asset(ImageAssets.defaultImage);
    }
  }
}
