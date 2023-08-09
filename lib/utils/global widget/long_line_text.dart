import '../../const/export.dart';

class LongLineText extends StatelessWidget {
  const LongLineText({
    super.key,
    required this.onTap,
    required this.text,
    required this.btnTxt,
  });

  final Function() onTap;
  final String text;
  final String btnTxt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: GoogleFonts.fjallaOne(
                  color: AppColor.kTextColor, fontSize: kTextSize.sp),
            ),
            TextSpan(
              text: btnTxt,
              style: GoogleFonts.fjallaOne(
                  color: AppColor.kPrimaryColor,
                  fontSize: kDefaultSize.sp,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}
