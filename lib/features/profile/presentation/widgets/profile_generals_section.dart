import 'package:fruit_hub_market/features/profile/presentation/widgets/profile_option_list.dart';
import '../../../../core/services/printer_services.dart';
import '../../../../core/utils/app_imports.dart';

class ProfileGeneralSection extends StatelessWidget {
  const ProfileGeneralSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'عام',
            style: Theme
                .of(
              context,
            )
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 10),
          ProfileOptionsList(
            text: 'الملف الشخصي',
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pushNamed(context, RouteManager.editProfile);
            },
            image: Assets.images.user.path,
          ),
          ProfileOptionsList(
            text: 'طلباتي',
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pushNamed(context, RouteManager.orders);
            },
            image: Assets.images.box.path,
          ),
          ProfileOptionsList(
            text: 'المفضلة',
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pushNamed(context, RouteManager.favorite);
            },
            image: Assets.images.heart.path,
          ),
          // Column(
          //   children: [
          //     ElevatedButton(
          //       onPressed: () async {
          //         final printers =
          //         await PrinterService.instance.scanPrinters();
          //
          //         print(printers);
          //       },
          //       child: const Text("Scan"),
          //     ),
          //
          //     ElevatedButton(
          //       onPressed: () async {
          //         final printers =
          //         await PrinterService.instance.scanPrinters();
          //
          //         await PrinterService.instance.connect(printers.first);
          //       },
          //       child: const Text("Connect"),
          //     ),
          //
          //     ElevatedButton(
          //       onPressed: () async {
          //         await PrinterService.instance.printTest();
          //       },
          //       child: const Text("Print Test"),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
