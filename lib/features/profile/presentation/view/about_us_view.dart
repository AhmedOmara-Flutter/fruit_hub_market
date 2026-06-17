import '../../../../core/utils/app_imports.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InfoActionRow(
              text: 'من نحن',
              isBack: true,
            ),

            const SizedBox(height: 20),

            // Logo
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: AppColor.mainColor.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.local_grocery_store_outlined,
                size: 55,
                color: AppColor.mainColor,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              "Fruit Hub",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "متجر فواكه طازجة مختارة بعناية من أفضل المزارع، نوصلها لك مباشرة لحد باب البيت بجودة عالية وسعر مناسب.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: const Color(0xff6B6F70),
                  height: 1.7,
                ),
              ),
            ),

            const SizedBox(height: 24),
            _buildFeature(
              context,
              icon: Icons.verified_outlined,
              title: "جودة مضمونة",
              desc: "بنختار الفواكه بعناية عشان نوصل لك أفضل جودة.",
            ),

            _buildFeature(
              context,
              icon: Icons.delivery_dining_outlined,
              title: "توصيل سريع",
              desc: "نوصل طلبك لحد باب البيت في أسرع وقت ممكن.",
            ),

            _buildFeature(
              context,
              icon: Icons.support_agent_outlined,
              title: "دعم 24/7",
              desc: "فريق الدعم متاح طول الوقت لمساعدتك.",
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.mainColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColor.mainColor.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.emoji_nature_outlined,
                      color: AppColor.mainColor,
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        "هدفنا هو نوصل لك فواكه طازة وصحية بأفضل تجربة تسوق ممكنة 🍎🍊🍇",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String desc,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xffE6E9EA),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.mainColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColor.mainColor),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}