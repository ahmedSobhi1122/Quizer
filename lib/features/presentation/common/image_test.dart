import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/core/resources/app_values.dart';

class ImageUploadField extends StatefulWidget {
  final double height;
  final String hint;
  final BoxFit fitter;

  const ImageUploadField({Key? key,this.height = 10,this.hint = "", required this.fitter}) : super(key: key);

  @override
  _ImageUploadFieldState createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends State<ImageUploadField> {
  Uint8List? _webImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        final imageBytes = await pickedFile.readAsBytes();
        setState(() {
          _webImage = imageBytes;
        });
      } else {
        // Handle for mobile (Android/iOS)
        final imageBytes = await pickedFile.readAsBytes();
        setState(() {
          _webImage = imageBytes;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _webImage == null
                ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 70.h,
                            top: 70.h,
                            child: Text(
                              widget.hint,
                              style: const TextStyle(
                                fontSize: AppSize.s20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor40,
                              ),
                            ),
                          ),
                          Center(
                            child: IconButton(
                              onPressed: _pickImage,
                              icon: Icon(
                                Icons.add_a_photo,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
                : Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Opacity(
                      opacity: 0.8,
                      child: Image.memory(
                        _webImage!,
                        fit: widget.fitter,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: _pickImage,
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey[700],
                      size: widget.height * 0.5, // Ensure it's proportional
                    ),
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
