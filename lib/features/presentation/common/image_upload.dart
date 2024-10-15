import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'dart:io';

import 'package:quizer/core/resources/app_values.dart';
import 'package:quizer/core/resources/assets_manager.dart';

class ImageUploadField extends StatefulWidget {
  final double height;
  String hint;
  final BoxFit fitter;
  final String defualtImage;
  ImageUploadField({super.key,this.height = 10, this.hint = "", required this.fitter,this.defualtImage = ImageAssets.image});

  @override
  _ImageUploadFieldState createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends State<ImageUploadField> {
  File? _image = null;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        widget.hint="";
      });
    }
  }

  File getImage(){
    return _image!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: widget.height,
            decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(20)),
            child
                : Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Opacity(
                      opacity: 0.8,
                      child: _image==null? Image.asset(widget.defualtImage,
                      fit: BoxFit.cover,):Image.file(
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
                        color: Colors.black54,
                        size: 50,
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hint,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45
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

