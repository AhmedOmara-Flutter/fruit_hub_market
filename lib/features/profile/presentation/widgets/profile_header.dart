import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/helper_function/get_user.dart';
import '../../../../core/helper_function/pick_image.dart';
import '../../../../core/utils/app_imports.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  File? imagePath;

  @override
  Widget build(BuildContext context) {
    final user = getUser();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: imagePath != null
                    ? FileImage(imagePath!)
                    : CachedNetworkImageProvider(user.image),
              )
              // Positioned(
              //   bottom: 0,
              //   right: 0,
              //   child: GestureDetector(
              //     onTap: () async {
              //       final image = await pickImage();
              //       if (image != null) {
              //         setState(() => imagePath = image);
              //       }
              //     },
              //     child: Container(
              //       padding: const EdgeInsets.all(5),
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         shape: BoxShape.circle,
              //         border: Border.all(color: Colors.grey.shade300),
              //       ),
              //       child: Icon(
              //         Icons.camera_alt,
              //         size: 16,
              //         color: AppColor.mainColor,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),

          const SizedBox(width: 12),

          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.userName,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    user.email,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}