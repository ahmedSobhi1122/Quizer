import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'dart:io';

import 'package:quizer/core/resources/app_values.dart';

class ImageUploadField extends StatefulWidget {
  final double height;
  final String hint;
  final BoxFit fitter;
  const ImageUploadField({Key? key, required this.height, required this.hint, required this.fitter}) : super(key: key);

  @override
  _ImageUploadFieldState createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends State<ImageUploadField> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: widget.height,
          decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20)),
          child: _image == null? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  widget.hint,
                  style: TextStyle(
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor40
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      _pickImage();
                    },
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey[700],
                    )
                )
              ],
            ),
          )
              : Stack(
            children: [
              Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.file(
                      _image!,
                      fit: widget.fitter,
                    ),
                  ),
                ),
              ),
              Center(
                child: IconButton(
                    onPressed: () {
                      _pickImage();
                    },
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey[700],
                      size: .5 *widget.height,
                    )
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
