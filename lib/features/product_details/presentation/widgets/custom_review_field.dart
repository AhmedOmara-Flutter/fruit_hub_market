import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/helper_function/get_user.dart';
import '../../../../core/utils/app_imports.dart';
import '../view_model/product_details_cubit.dart';

class CustomReviewField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onSuffixPressed;
  final bool isTyped;
  final void Function(String)? onChanged;
  const CustomReviewField({super.key, required this.controller, this.onSuffixPressed, this.isTyped=false, this.onChanged,});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged:onChanged,
      decoration: InputDecoration(
        hintText: 'اكتب التعليق..',
        prefixIcon: Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child:  ClipOval(
            child: CachedNetworkImage(
              imageUrl: getUser().image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Skeletonizer(
                    enabled: true,
                    child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[300],
                  ),),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Colors.red),
            ),),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left:10),
          child: IconButton(
              onPressed:isTyped? onSuffixPressed:null,
              icon: Icon(Icons.send_rounded,color:isTyped? Color(0xff1B5E37):null)),
        ),
        hintStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: Color(0xff111719)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
      ),
    );

  }
}
