import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_color.dart';

class CustomImagePicker extends StatefulWidget {
  final ValueChanged<File?> onImagePicked;
  final String? initialImage;

  const CustomImagePicker({
    super.key,
    required this.onImagePicked,
    this.initialImage,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? imagePath;
  String? networkImage;

  @override
  void initState() {
    super.initState();
    networkImage = widget.initialImage;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final ImagePicker picker = ImagePicker();
          final XFile? image = await picker.pickImage(
            source: ImageSource.gallery,
          );
          if (image != null) {
            setState(() {
              imagePath = File(image.path);
              widget.onImagePicked(imagePath!);
            });
          }
        } on Exception catch (e) {
          print(e);
        }
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            margin: EdgeInsets.only(
                top:30,
                right: imagePath!=null?5:15),
            child: imagePath != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(10),

                  child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      child: Image.file(imagePath!,fit: BoxFit.cover,),
                    ),
                )
                : networkImage != null
                ? SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    child: Image.network(networkImage!, fit: BoxFit.cover),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_outlined,
                        color: AppColor.mainColor,
                        size: 40,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
