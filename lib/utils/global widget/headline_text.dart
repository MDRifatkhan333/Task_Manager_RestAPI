import '../../const/export.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: AutoSizeText(
        text,
        style: GoogleFonts.lilitaOne(
          fontSize: kPrimaryBigSize.sp,
          fontStyle: FontStyle.italic,
          color: AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}
