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
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 12.h,
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 82.w,
                height: 82.w,
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.mainColor,
                    width: 2.w,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: AppColor.card,
                  backgroundImage: imagePath != null
                      ? FileImage(imagePath!)
                      : CachedNetworkImageProvider(user.image),
                ),
              ),
              //
              // Positioned(
              //   bottom: 2.h,
              //   right: -2.w,
              //   child: GestureDetector(
              //     onTap: () async {
              //       final image = await pickImage();
              //       if (image != null) {
              //         setState(() {
              //           imagePath = image;
              //         });
              //       }
              //     },
              //     child: Container(
              //       width: 28.w,
              //       height: 28.w,
              //       decoration: BoxDecoration(
              //         color: AppColor.mainColor,
              //         shape: BoxShape.circle,
              //         border: Border.all(
              //           color: AppColor.background,
              //           width: 2.w,
              //         ),
              //       ),
              //       child: Icon(
              //         Icons.edit_rounded,
              //         color: AppColor.white,
              //         size: 15.sp,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColor.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8.h),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.card,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: AppColor.border,
                    ),
                  ),
                  child: Text(
                    user.email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColor.textSecondary,
                      fontSize: 13.sp,
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