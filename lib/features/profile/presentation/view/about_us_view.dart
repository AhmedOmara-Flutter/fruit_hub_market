import 'package:fruit_hub_market/core/utils/app_imports.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  String version = "0.0.0";

  @override
  void initState() {
    super.initState();
   // _getVersion();
  }

  // Future<void> _getVersion() async {
  //   final info = await PackageInfo.fromPlatform();
  //   setState(() {
  //     version = info.version;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAF8),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: InfoActionRow(
              text: 'من نحن', showBack: true, bottomPadding: 0,),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Expanded(child: SizedBox(width: 5,)),
                          Column(
                            children: [
                              Text('مرحبا بك في', style: Theme
                                  .of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                  color: AppColor.mainColor),),
                              Text('قطيف', style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                  color: AppColor.mainColor.withOpacity(0.6)),),
                              const SizedBox(height: 10),
                              Text(
                                  'تطبيق قطيف وجهتك \nالصحيه لكل ما يخص الفواك\nالطازجه والطبيعيه',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: AppColor.mainColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.asset(
                            Assets.images.fruits.path, fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                AboutCard(
                  title: "رؤيتنا",
                  description:
                  "أن نكون التطبيق الأول في العالم العربي لتقديم أجود أنواع الفواكه.",
                  image:
                  Assets.images.sights.path, icon: Icons.gps_fixed,

                ),
                const SizedBox(height: 15),
                AboutCard(
                  title: "رسالتنا",
                  description:
                  'تقديم فواكه طازجه وعاليه الجوده مع الحرص علي رضا العملاء. ',
                  image:
                  Assets.images.message.path, icon: Icons.remove_red_eye,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ValuesCard(),
                ),
                Text(
                  'الإصدار ${version}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '© 2026 قطيف - جميع الحقوق محفوظة',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  const AboutCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
  });

  final String title;
  final String description;
  final String image;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
        top: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: AppColor.mainColor.withOpacity(0.04),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: -10,
            child: SizedBox(
              child: Center(
                child: Image.asset(image, height: 110, fit: BoxFit.cover,
                  color: AppColor.mainColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Row(
              children: [

                Expanded(child: const SizedBox(width: 5)),

                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration:  BoxDecoration(
                              color: AppColor.mainColor.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              icon,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 10),

                          Text(
                            title,
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                color: AppColor.mainColor
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                            color: AppColor.mainColor.withOpacity(0.6)
                        ),
                      ),
                    ],
                  ),
                ),
              ]
          ),

        ],
      ),
    );
  }
}

class ValuesCard extends StatelessWidget {
  const ValuesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF7F9F3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:  BoxDecoration(
              color: AppColor.mainColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.groups_rounded,
              color: Colors.white,
              size: 23,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            "قيمنا",
            style: Theme
                .of(context)
                .textTheme
                .labelSmall!
                .copyWith(
                color: AppColor.mainColor
            ),
          ),

          const SizedBox(height: 15),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueItem(
                icon: Icons.sentiment_satisfied_alt_outlined,
                title: "الرضا",
                subtitle: "راحة عملائنا هي اولويتنا",
              ),

              ValueItem(
                icon: Icons.favorite_border,
                title: "الصحة",
                subtitle: "ندعم نمط حياة صحي",
              ),

              ValueItem(
                icon: Icons.shield_outlined,
                title: "الثقة",
                subtitle: "نلتزم بالشفافية",
              ),

              ValueItem(
                icon: Icons.eco_outlined,
                title: "الجودة",
                subtitle: "نختار الأفضل لك دائماً",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ValueItem extends StatelessWidget {
  const ValueItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColor.mainColor.withOpacity(0.5),
            size: 32,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .titleSmall!
                .copyWith(
                color: AppColor.mainColor
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .titleSmall!
                .copyWith(
                color: AppColor.mainColor.withOpacity(0.6)
            ),
          ),
        ],
      ),
    );
  }
}