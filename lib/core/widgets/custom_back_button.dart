import '../utils/app_imports.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;

  const CustomBackButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: Color(0xffF1F1F5)
              ),
            ),
            child: Center(child: SvgPicture.asset(Assets.images.arrowBack.path,)),
          ),
        ),
      ),
    );
  }
}
