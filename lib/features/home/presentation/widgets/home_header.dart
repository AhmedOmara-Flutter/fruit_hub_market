import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/offers/presentation/view_model/offer_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.mainColor,
                width: 2.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.35),
                  blurRadius: 15.r,
                  offset: Offset(0, 6.h),
                ),
              ],
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: getUser().image,
                width: 68.w,
                height: 68.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Container(
                    width: 68.w,
                    height: 68.w,
                    color: AppColor.card,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 68.w,
                  height: 68.w,
                  color: AppColor.card,
                  child: Icon(
                    Icons.person,
                    color: AppColor.mainColor,
                    size: 34.sp,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(width: 15.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "صباح الخير 👋",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColor.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  getUser().userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StyleManager.font19Weight700.copyWith(
                    color: AppColor.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
if(context.read<OfferCubit>().offers.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100.r),
                onTap: () {
                  Navigator.pushNamed(context, RouteManager.search);
                },
                child: Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    color: AppColor.card,
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(
                      color: AppColor.border,
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.images.search.path,
                      width: 24.w,
                      height: 24.w,
                      colorFilter: const ColorFilter.mode(
                        AppColor.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}