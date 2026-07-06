import '../utils/app_imports.dart';

class CustomShowDialog {
  static Future<void> show(
      BuildContext context, {
        required String title,
        required Widget content,
        VoidCallback? cancel,
        VoidCallback? accept,
        Color color = AppColor.mainColor,
        IconData flag = Icons.payment_rounded,
        String cancelText = 'إلغاء',
        String acceptText = 'تأكيد',
      }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          backgroundColor: AppColor.card,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          contentPadding: EdgeInsets.all(22.w),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72.w,
                height: 72.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(.12),
                ),
                child: Icon(
                  flag,
                  size: 36.sp,
                  color: color,
                ),
              ),

              SizedBox(height: 18.h),

              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColor.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              content,

              SizedBox(height: 24.h),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: cancel ?? () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColor.textPrimary,
                        side: BorderSide(
                          color: AppColor.border,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      child: Text(
                        cancelText,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColor.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: accept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: color,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        side: BorderSide(
                          color: color,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      child: Text(
                        acceptText,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: color,
                        ),
                      ),
                    ),
                  ),                ],
              ),
            ],
          ),
        );
      },
    );
  }
}