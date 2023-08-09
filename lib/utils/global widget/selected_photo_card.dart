
import '../../const/export.dart';

class ChoosePhoto extends StatelessWidget {
  const ChoosePhoto({
    super.key,
    this.clipBehavior = Clip.none,
    required this.img,
    this.onTap,
  });

  final File? img;
  final Clip clipBehavior;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        padding: EdgeInsets.all(5.sp),
        child: Center(
          child: ClipRRect(
              clipBehavior: clipBehavior,
              borderRadius: BorderRadius.circular(kPrimaryBigSize.sp),
              child: Image.file(
                img!,
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
