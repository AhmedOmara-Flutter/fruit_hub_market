import 'package:fruit_hub_market/features/profile/presentation/widgets/toggle_button.dart';
import '../../../../core/utils/app_imports.dart';

class ProfileOptionsList extends StatelessWidget {
  final bool isButton;
  final String text;
  final String image;
  final VoidCallback? onTap;

  const ProfileOptionsList({
    super.key,
    this.isButton = false,
    required this.text,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.15),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  image,
                  color: AppColor.mainColor,
                  width: 20,
                  height: 20,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xff2C2C2C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              if (isButton)
                const ToggleButton()
              else
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
            ],
          ),
        ),
      ),
    );
  }
}