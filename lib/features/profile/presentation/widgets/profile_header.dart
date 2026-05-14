import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:image_picker/image_picker.dart';
import '../../../../core/helper_function/get_user.dart';
import '../../../../core/helper_function/pick_image.dart';
import '../../../../core/utils/app_imports.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  ImagePicker imagePicker = ImagePicker();
  File? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(radius: 50, backgroundColor: Colors.white),
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: getUser().image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Skeletonizer(child: Container(
                      ),),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: AppColor.red),
                ),),
              Positioned(
                bottom: -5,
                child: CircleAvatar(backgroundColor: Colors.white, radius: 18),
              ),
              Positioned(
                bottom: -5,
                child: GestureDetector(
                  onTap: () async {
                    final image = await pickImage();
                    if (image != null) {
                      setState(() {
                        imagePath = image;
                      });
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF9F9F9),
                      image: DecorationImage(
                        image: svg.Svg(Assets.images.camera.path,),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getUser().userName,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                getUser().email,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Color(0xff888FA0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
