import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'dart:io';

import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';

class ImageUploadField extends StatefulWidget {
  final double? height;
  String? hint;
  final BoxFit? fitter;
  final String? defaultImage;
  final Future<void> Function() onImageSelected;
  File? image;

  ImageUploadField({
    super.key,
    this.height,
    this.hint,
    this.fitter,
    this.defaultImage = ImageAssets.image,
    required this.onImageSelected,
    required this.image
  });

  @override
  _ImageUploadFieldState createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends State<ImageUploadField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: widget.height ?? AppSize.s10.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Opacity(
                      opacity: 0.8,
                      child: widget.image == null
                          ? Image.asset(
                              widget.defaultImage ?? ImageAssets.defaultImage,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              widget.image!,
                              fit: widget.fitter ?? BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                      onPressed: widget.onImageSelected,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.black54,
                        size: AppSize.s50.r,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hint ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
