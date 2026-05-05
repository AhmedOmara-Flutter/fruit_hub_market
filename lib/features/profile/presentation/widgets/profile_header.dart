import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper_function/get_user.dart';
import '../../../../core/utils/app_imports.dart';
import '../view_model/profile_cubit.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  ImagePicker imagePicker = ImagePicker();
  File? imagePath;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getImage();
  }

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
              ProfileImageBloc(),
              Positioned(
                bottom: -5,
                child: CircleAvatar(backgroundColor: Colors.white, radius: 18),
              ),
              Positioned(
                bottom: -5,
                child: GestureDetector(
                  onTap: () async {
                    try {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (image != null) {
                        setState(() {
                          imagePath = File(image.path);
                        });
                      }
                    } catch (e) {
                      print(e);
                    }

                    context.read<ProfileCubit>().addImage(imagePath!);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF9F9F9),
                      image: DecorationImage(
                        image: svg.Svg(Assets.images.camera.path),
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

class ProfileImageBloc extends StatelessWidget {
  const ProfileImageBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();

        if (cubit.imageUrl != null && cubit.imageUrl!.isNotEmpty) {
          return CircleAvatar(
            radius: 40,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: cubit.imageUrl!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                const Skeletonizer(child: CircleAvatar(
                  radius: 40,
                )),
                errorWidget: (context, url, error) =>
                    Image.asset(Assets.images.homeImage.path),
              ),
            ),
          );
        }

        return CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(Assets.images.homeImage.path),
        );
      },
    );  }
}
