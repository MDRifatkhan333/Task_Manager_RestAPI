import '../../../const/export.dart';

class PhotosText extends StatelessWidget {
  const PhotosText({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.kTextColor,
        ),
        child: Center(
          child: Text(
            'Choose Photo',
            style: GoogleFonts.abyssinicaSil(
              color: AppColor.kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
